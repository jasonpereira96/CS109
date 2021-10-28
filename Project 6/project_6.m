
function [corrcoef1, corrcoef2] = analyze_it(opt)
    load('CookCountyFoodInsecurity.mat');
    dataset = "";
    if opt == "black or african american"
        dataset = blackFoodDesert;
    elseif opt == "white"
        dataset = whiteFoodDesert;
    elseif opt == "asian"
        dataset = asianFoodDesert;
    elseif opt == "hispanic"
        dataset = hispanicFoodDesert;
    else 
        dataset = lowIncomeFoodDesert;
    end
    %A = [1,2,3,4,5];
    %B = [2,6,5,7,4];
    %disp(corrcoef(A, B));
    %disp(corrcoef_mine(A, B));

    subplot(2,1,1);
    x = povertyRate ./ 100;
    y = dataset ./ population;
    cc = corrcoef_mine(x, y);
    disp(cc);
    corrcoef1 = cc;
    scatter(x, y,5, 'filled','MarkerFaceColor', 'blue');

    subplot(2,1,2);
    x = dataset./ population;
    y = withoutCars ./ population;
    cc = corrcoef_mine(x, y);
    corrcoef2 = cc;
    disp(cc);
    scatter(x, y,5, 'filled','MarkerFaceColor', 'blue');
    
end

function [res] = sigma(X)
    sum = 0;
    for index = 1:length(X)
        sum = sum + X(index);
    end
    res = sum;
end

function [res] = mean_(X)
    res = sigma(X) / length(X);
end

function  [res] = std_dev(X)
    N = length(X);
    m = mean_(X);
    res = sqrt((1 / (N - 1)) * sigma((X - m) .^ 2));
end

function  [res] = variance(X)
    res = std_dev(X) ^ 2;
end

function [res] = covariance(X, Y)
    N = length(X);
    X_bar = mean_(X);
    Y_bar = mean_(Y);
    res = (1 / (N -1)) * sigma((X - X_bar) .* (Y - Y_bar));
end

function [corr_coef_xy] = corrcoef_mine(x, y)
    corr_coef_xy = covariance(x, y) / sqrt(variance(x) * variance(y));
end



