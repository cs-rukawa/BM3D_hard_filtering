dis_cell = resCell;
patch_cell = cell(size(patch_cell));

for i = 1:numel(patch_cell)
    cave = patch_cell{i};
    patches = zeros(64, 50, 'uint8');
    for j = 1:numel(cave)
        patch = cave{j};
        patches(:, j) = patch(:);
    end
    patch_cell{i} = patches;
end

save('sigma20.mat', 'im_n', 'patch_cell', 'sigma', 'dis_cell');