% Define control points for a Bézier tetrahedron
n = 3; % Degree of the Bernstein polynomial
P = rand(n+1, n+1, n+1, 4); % Random control points, 4 coordinates for each (x, y, z, w)

% Barycentric coordinates for evaluation
t1 = 0.3; t2 = 0.4; t3 = 0.2; t4 = 0.1; 

% Ensure barycentric coordinates sum to 1
assert(abs(t1 + t2 + t3 + t4 - 1) < 1e-10, 'Barycentric coordinates must sum to 1.');

% De Casteljau algorithm for trivariate case
for r = 1:n
    for i = 1:(n-r-1)
        for j = 1:(n-r-1-i)
            for k = 1:(n-r-1-i-j)
                % Update control points based on De Casteljau recursion
                P(i, j, k, :) = t1 * P(i, j, k, :) + ...
                                t2 * P(i-1, j, k, :) + ...
                                t3 * P(i, j-1, k, :) + ...
                                t4 * P(i, j, k-1, :);
            end
        end
    end
end

% The resulting point in 3D space
result_point = squeeze(P(1, 1, 1, :));
disp('Point on Bézier tetrahedron:');
disp(result_point);
