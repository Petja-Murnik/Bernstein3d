% Function to approximate
f = @(x, y, z) x.^2 + y.^2 + z.^2;

% Degree of Bernstein polynomials
n = 3;

% Generate grid points for the tetrahedron
[x, y, z] = ndgrid(linspace(0, 1, 30), linspace(0, 1, 30), linspace(0, 1, 30));
mask = (x + y + z <= 1); % Restrict to the tetrahedron
x_tetra = x(mask);
y_tetra = y(mask);
z_tetra = z(mask);

% Initialize the approximation
approx = zeros(size(x_tetra));

% Compute the Bernstein approximation
for i = 0:n
    for j = 0:(n-i)
        k = n - i - j; % Compute k to satisfy i + j + k = n
        % Bernstein basis function
        B = nchoosek(n, i) * nchoosek(n-i, j) * ...
            x_tetra.^i .* y_tetra.^j .* z_tetra.^k .* (1 - x_tetra - y_tetra - z_tetra).^(n - i - j - k);
        % Approximation coefficients
        f_ijk = f(i/n, j/n, k/n);
        % Add contribution to the approximation
        approx = approx + f_ijk * B;
    end
end

% Plot the results
figure;

% Original function sampled on the tetrahedron
orig_vals = f(x_tetra, y_tetra, z_tetra);

subplot(1, 2, 1);
scatter3(x_tetra, y_tetra, z_tetra, 10, orig_vals, 'filled');
title('Original Function on Tetrahedron');
xlabel('x'); ylabel('y'); zlabel('z'); colorbar;
view(3);

% Approximated function on the tetrahedron
subplot(1, 2, 2);
scatter3(x_tetra, y_tetra, z_tetra, 10, approx, 'filled');
title('Bernstein Approximation');
xlabel('x'); ylabel('y'); zlabel('z'); colorbar;
view(3);
