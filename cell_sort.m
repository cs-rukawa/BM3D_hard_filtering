function sorted_cell = cell_sort( patch_cell, dis_cell, im_n, p_sz )
    sorted_cell = cell(size(patch_cell));
    for i = 1:size(patch_cell, 1)
        for j = 1:size(patch_cell, 2)
            patches = patch_cell{i, j};
            [~, ind] = sort(dis_cell{i, j}, 'ascend');
            patches = patches(:, ind);
            
            pat = im_n(i:i+p_sz-1, j:j+p_sz-1);
            sorted_cell{i, j} = [pat(:), patches];
        end
    end
end

