local hypot = require("lib/utils/Bezier3Point").hypot
local abs = math.abs
local abscissae = {
	-0.06405689286260563,
	0.06405689286260563,
	-0.1911188674736163,
	0.1911188674736163,
	-0.3150426796961634,
	0.3150426796961634,
	-0.4337935076260451,
	0.4337935076260451,
	-0.5454214713888396,
	0.5454214713888396,
	-0.6480936519369755,
	0.6480936519369755,
	-0.7401241915785544,
	0.7401241915785544,
	-0.820001985973903,
	0.820001985973903,
	-0.8864155270044011,
	0.8864155270044011,
	-0.9382745520027328,
	0.9382745520027328,
	-0.9747285559713095,
	0.9747285559713095,
	-0.9951872199970213,
	0.9951872199970213
}
local weights = {
	0.12793819534675216,
	0.12793819534675216,
	0.1258374563468283,
	0.1258374563468283,
	0.12167047292780339,
	0.12167047292780339,
	0.1155056680537256,
	0.1155056680537256,
	0.10744427011596563,
	0.10744427011596563,
	0.09761865210411388,
	0.09761865210411388,
	0.08619016153195327,
	0.08619016153195327,
	0.0733464814110803,
	0.0733464814110803,
	0.05929858491543678,
	0.05929858491543678,
	0.04427743881741981,
	0.04427743881741981,
	0.028531388628933663,
	0.028531388628933663,
	0.0123412297999872,
	0.0123412297999872
}

local function length_function(coefficients, derivative1_for)
	return function (t, x1, y1, x2, y2, x3, y3, x4, y4)
		local ax, bx, cx = coefficients(x1, x2, x3, x4)
		local ay, by, cy = coefficients(y1, y2, y3, y4)
		local z2 = t / 2
		local sum = 0

		for i = 1, #abscissae, 1 do
			local corrected_t = z2 * abscissae[i] + z2
			local dx = derivative1_for(corrected_t, ax, bx, cx)
			local dy = derivative1_for(corrected_t, ay, by, cy)
			sum = sum + weights[i] * hypot(dx, dy)
		end

		return z2 * sum
	end
end

