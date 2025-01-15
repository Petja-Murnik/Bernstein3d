% Control points for a Bézier surface
P = rand(4, 4, 3); % Random control points (4x4 grid)
n = size(P, 1) - 1;

[u, v] = meshgrid(linspace(0, 1, 50), linspace(0, 1, 50));
B = @(i, n, t) nchoosek(n, i) * t.^i .* (1-t).^(n-i);
surface = zeros(size(u, 1), size(u, 2), 3);

for i = 0:n
    for j = 0:n
        Bu = B(i, n, u);
        Bv = B(j, n, v);
        surface = surface + P(i+1, j+1, :) .* Bu .* Bv; % Tensor product
    end
end

% Plot Bézier surface
surf(surface(:, :, 1), surface(:, :, 2), surface(:, :, 3));
title('Bézier Surface');
xlabel('X'); ylabel('Y'); zlabel('Z');
