function pred_cell = hard_filt(sorted_cell, sigma, p_sz)
    
    TH = 2.7*sigma; % thresholding factor
    p_depth = 32; % similar patches

    % DCT & Hadamard transform matrix
    D = kron(dctmtx(p_sz), dctmtx(p_sz));
    DT = D';
    H = hadamard(p_depth) / sqrt(p_depth);
    HT = H';

    pred_cell = cell(size(sorted_cell));
    parfor i = 1:numel(sorted_cell)
        P = double(sorted_cell{i}(:, 1:p_depth));
        % (H'*H*(DP)')' = DP*H'*H
        HDP = D*P*HT;
        HDP(abs(HDP)<TH) = 0;
        P_hat = DT*(HDP*H);
        pred_cell{i} = P_hat;
    end
    
end
