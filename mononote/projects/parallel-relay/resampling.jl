using Random

function systematic_resampling(N_in, N_out, weights)
    weight_sum = sum(weights)
    normalised_weights = weights/weight_sum
    cdf = cumsum(normalised_weights)
    
    U = rand()
    eps = U/N_out

    points = eps .+ (0:(N_out-1)) ./ N_out
    indices = searchsortedfirst.(Ref(cdf), points)
    return indices
end
