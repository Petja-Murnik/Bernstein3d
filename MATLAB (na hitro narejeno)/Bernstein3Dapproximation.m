n = 4; % Degree of the polynomial
[x, y, z] = meshgrid(linspace(0, 1, 30));
f = @(x, y, z) x.^2 + y.^2 + z.^2; % Function to approximate
approx = 0;

for i = 0:n
    for j = 0:(n-i)
        for k = 0:(n-i-j)
            B = nchoosek(n, i) * nchoosek(n-i, j) * ...
                x.^i .* y.^j .* z.^k .* (1-x-y-z).^(n-i-j-k);
            approx = approx + B .* f(i/n, j/n, k/n); % Approximation
        end
    end
end

% Plot original and approximation
figure;
subplot(1, 2, 1); slice(x, y, z, f(x, y, z), 0.5, 0.5, 0.5); title('Original Function');
subplot(1, 2, 2); slice(x, y, z, approx, 0.5, 0.5, 0.5); title('Approximation');
