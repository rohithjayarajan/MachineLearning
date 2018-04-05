%% Compute det|Covariance| and inv(Covariance)

function [detSigma, invSigma] = computeDetnInv(sigm, totalClasses)

for iter = 1 : totalClasses
    detSigma(iter) = det((sigm(:, :, iter)));
    invSigma(:,:,iter) = inv(sigm(:, :, iter));
end

end