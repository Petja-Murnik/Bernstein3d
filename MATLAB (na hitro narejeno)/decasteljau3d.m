% Define control points for a Bézier surface
P = rand(4, 4, 3); % Random control points
t = 0.5; % Example parameter value
n = size(P, 1) - 1;

% De Casteljau algorithm
for r = 1:n
    for i = 1:(n-r+1)
        for j = 1:(n-r+1)
            P(i, j, :) = (1-t) * P(i, j, :) + t * P(i+1, j+1, :);
        end
    end
end

% The resulting point on the Bézier surface
disp('Point on Bézier surface:');
disp(squeeze(P(1, 1, :)));
