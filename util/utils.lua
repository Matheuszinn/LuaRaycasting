local utils = {}

function utils.round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

return utils