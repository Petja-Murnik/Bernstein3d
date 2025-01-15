n = 3; % Degree of the polynomial
[x, y, z] = meshgrid(linspace(0, 1, 50), linspace(0, 1, 50), linspace(0, 1, 50));
B = @(i, j, k, n, x, y, z) nchoosek(n, i) * nchoosek(n-i, j) * ...
    x.^i .* y.^j .* z.^k .* (1-x-y-z).^(n-i-j-k);
i = 1; j = 1; k = 1; % Example indices
B_val = B(i, j, k, n, x, y, z);
isosurface(x, y, z, B_val, 0.5);
title('3D Bernstein Polynomial');
xlabel('x'); ylabel('y'); zlabel('z');
grid on;
