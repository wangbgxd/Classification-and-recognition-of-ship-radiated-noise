function Y = elmpredict(p_test, IW, B, LW, TF, TYPE)


Q = size(p_test, 2);
BiasMatrix = repmat(B, 1, Q);
tempH = IW * p_test + BiasMatrix;


switch TF
    case 'sig'
        H = 1 ./ (1 + exp(-tempH));
    case 'hardlim'
        H = hardlim(tempH);
end


Y = (H' * LW)';


if TYPE == 1
    temp_Y = zeros(size(Y));
    for i = 1:size(Y, 2)
        [~, index] = max(Y(:, i));
        temp_Y(index, i) = 1;
    end
    Y = vec2ind(temp_Y); 
end