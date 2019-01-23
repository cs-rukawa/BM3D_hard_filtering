% run translate.m first
load('sigma20.mat');

pat_sz = 8;
sigma = 20;

sorted_cell = cell_sort(patch_cell, dis_cell, im_n, pat_sz);
pred_patches = hard_filt(sorted_cell, sigma, pat_sz);

Accumulator = zeros(size(im_n));
counting = zeros(size(im_n));
k = 0;
for i = 1:size(pred_patches, 1)
    for j = 1:size(pred_patches, 2)
        k = k+1;
        pat = reshape(pred_patches{k}(:, 1), pat_sz, pat_sz);
        Accumulator(i:i+pat_sz-1, j:j+pat_sz-1) = ...
            Accumulator(i:i+pat_sz-1, j:j+pat_sz-1) + pat;
        counting(i:i+pat_sz-1, j:j+pat_sz-1) = ...
            counting(i:i+pat_sz-1, j:j+pat_sz-1) + 1;
    end
end
im_hat = Accumulator ./ counting;
psnr = im_psnr(im, im_hat);
fprintf('PSNR: %.2f', psnr);