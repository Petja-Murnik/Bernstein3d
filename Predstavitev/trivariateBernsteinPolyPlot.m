% Define the degree of the Bernstein polynomial
n = 3; % Example degree

% Define the tetrahedron vertices (in barycentric coordinates)
V1 = [1, 0, 0];
V2 = [0, 1, 0];
V3 = [0, 0, 1];
V4 = [0, 0, 0]; 

% Generate a grid of points inside the tetrahedron
num_points = 30;
[x, y, z] = ndgrid(linspace(0, 1, num_points), linspace(0, 1, num_points), linspace(0, 1, num_points));
mask = (x + y + z <= 1); % Ensure points satisfy x + y + z <= 1
x_tetra = x(mask);
y_tetra = y(mask);
z_tetra = z(mask);

% Degrees of Bernstein polynomials to visualize
degrees = 1;
%degrees = 2;

% Define the tetrahedron vertices (in barycentric coordinates)
V1 = [1, 0, 0];
V2 = [0, 1, 0];
V3 = [0, 0, 1];
V4 = [0, 0, 0]; % Origin

% Generate a grid of points inside the tetrahedron
num_points = 30;
[x, y, z] = ndgrid(linspace(0, 1, num_points), linspace(0, 1, num_points), linspace(0, 1, num_points));
mask = (x + y + z <= 1); % Ensure points satisfy x + y + z <= 1
x_tetra = x(mask);
y_tetra = y(mask);
z_tetra = z(mask);

% Loop over degrees
for d = degrees
    figure;
    % Total number of polynomials for a given degree d
    num_polynomials = (d + 1) * (d + 2) * (d + 3) / 6;
    plot_idx = 1; % Subplot index
    
    % Create subplots for each polynomial
    for i = 0:d
        for j = 0:(d-i)
            for k = 0:(d-i-j)
                l = d - i - j - k; % Ensure i + j + k + l = d

                % Compute the Bernstein basis function
                B = nchoosek(d, i) * nchoosek(d - i, j) * nchoosek(d - i - j, k) * ...
                    x_tetra.^i .* y_tetra.^j .* z_tetra.^k .* (1 - x_tetra - y_tetra - z_tetra).^l;

                % Plot the Bernstein basis function
                subplot(ceil(sqrt(num_polynomials)), ceil(sqrt(num_polynomials)), plot_idx);
                scatter3(x_tetra, y_tetra, z_tetra, 15, B, 'filled');
                colormap(jet);
                colorbar;
                title(sprintf('B_{%d,%d,%d,%d}^%d', i, j, k, l, d));
                xlabel('x'); ylabel('y'); zlabel('z');
                grid on;
                view(3);
                
                % Increment subplot index
                plot_idx = plot_idx + 1;
            end
        end
    end

    % Add a title to the figure
    sgtitle(sprintf('Trivariate Bernstein Polynomials for d = %d', d));
end


% Define the degree of the Bernstein polynomial
n = 3; % Example degree

% Define the tetrahedron vertices (in barycentric coordinates)
V1 = [1, 0, 0];
V2 = [0, 1, 0];
V3 = [0, 0, 1];
V4 = [0, 0, 0]; % Origin

% Generate a grid of points inside the tetrahedron
num_points = 30;
[x, y, z] = ndgrid(linspace(0, 1, num_points), linspace(0, 1, num_points), linspace(0, 1, num_points));
mask = (x + y + z <= 1); % Ensure points satisfy x + y + z <= 1
x_tetra = x(mask);
y_tetra = y(mask);
z_tetra = z(mask);

% Choose indices for the Bernstein basis function
i = 1; j = 1; k = 1; l = n - i - j - k; % Ensure i + j + k + l = n

% Compute the Bernstein basis function
B = nchoosek(n, i) * nchoosek(n - i, j) * nchoosek(n - i - j, k) * ...
    x_tetra.^i .* y_tetra.^j .* z_tetra.^k .* (1 - x_tetra - y_tetra - z_tetra).^l;

% Plot the Bernstein basis function
%figure;
scatter3(x_tetra, y_tetra, z_tetra, 15, B, 'filled');
colormap(jet);
colorbar;
title(sprintf('Trivariate Bernstein Polynomial B_{%d,%d,%d,%d}^%d', i, j, k, l, n));
xlabel('x'); ylabel('y'); zlabel('z');
grid on;
view(3);
