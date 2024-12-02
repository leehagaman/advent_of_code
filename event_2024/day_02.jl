### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ e6639660-afa0-11ef-0de6-a97c47018cfa
md"# Day 2"

# ╔═╡ 82f8979a-a869-465c-a573-59a1ad2b89bc
md"## Part 1"

# ╔═╡ 71d79d51-9881-4ee2-9ed9-2247b6b5ccbe
function is_safe(report)
	safe = 1
	rising = (report[2] - report[1] > 0)
	num_levels = length(report)
	for i in 1:num_levels - 1
		if abs(report[i+1] - report[i]) > 3
			safe = 0
		end
		if rising && report[i+1] - report[i] < 0
			safe = 0
		end
		if !rising && report[i+1] - report[i] > 0
			safe = 0
		end
		if report[i+1] == report[i]
			safe = 0
		end
	end
	return safe
end

# ╔═╡ 98ac074e-29b0-4d6a-b7ec-2b318b4f3dbb
md"## Part 2"

# ╔═╡ 47f5ffcb-0059-4b2f-ad4c-e4d4211f05b8
function is_safe_one_bad_level(report)
	num_levels = length(report)
	safe = 0
	for i in 1:num_levels
		mod_report = copy(report)
		deleteat!(mod_report, i)
		if is_safe(mod_report) == 1
			safe = 1
		end
	end
	return safe
end

# ╔═╡ 61d65bfb-2193-469b-8b0a-6ee695a49e7b
md"## Input"

# ╔═╡ ae0762d8-9218-4446-b130-f0daa43de40e
filename = "input_day_02.txt"
#filename = "test_day_02.txt"

# ╔═╡ e44a5803-3d1f-4163-9443-f9b8191a8323
open(filename) do f
    global input_str = read(f, String)
end

# ╔═╡ 16c66b67-eba0-44de-a0e4-1037ece8d2a0
input_rows = split(input_str, "\n")

# ╔═╡ 5fbe84f2-1c31-4fbe-910c-b0071de387b4
input_rows_clean = filter(s -> s != "", input_rows)

# ╔═╡ fa31800f-a358-43ad-8c3c-eb0af2fae3b7
input_row_splits = map(x -> split(x), input_rows_clean)

# ╔═╡ 11068dfe-b216-4a2a-a76f-a8dc683438f3
input = map(row -> map(x -> parse(Int, x), row), input_row_splits)

# ╔═╡ d6b53a8a-5fa4-416d-9f0a-f37de4b306dc
safe_reports = map(report -> is_safe(report), input)

# ╔═╡ fd2c8535-239a-4910-9540-4468d178e02d
sum(safe_reports)

# ╔═╡ e4cba6e1-0c19-41b0-b741-eb0c3685b7ed
safe_reports_one_bad_level = map(report -> is_safe_one_bad_level(report), input)

# ╔═╡ 64b4314e-c25b-45eb-81a9-a8f033068a80
sum(safe_reports_one_bad_level)

# ╔═╡ cb60bfcb-f528-4231-83d4-cfb3ee372f7a
num = length(input)

# ╔═╡ 332d1d1f-405c-4ab9-84bf-c9c856f6c3c7
md"## Imports"

# ╔═╡ Cell order:
# ╠═e6639660-afa0-11ef-0de6-a97c47018cfa
# ╟─82f8979a-a869-465c-a573-59a1ad2b89bc
# ╠═71d79d51-9881-4ee2-9ed9-2247b6b5ccbe
# ╠═d6b53a8a-5fa4-416d-9f0a-f37de4b306dc
# ╠═fd2c8535-239a-4910-9540-4468d178e02d
# ╟─98ac074e-29b0-4d6a-b7ec-2b318b4f3dbb
# ╠═47f5ffcb-0059-4b2f-ad4c-e4d4211f05b8
# ╠═e4cba6e1-0c19-41b0-b741-eb0c3685b7ed
# ╠═64b4314e-c25b-45eb-81a9-a8f033068a80
# ╠═61d65bfb-2193-469b-8b0a-6ee695a49e7b
# ╠═ae0762d8-9218-4446-b130-f0daa43de40e
# ╠═e44a5803-3d1f-4163-9443-f9b8191a8323
# ╠═16c66b67-eba0-44de-a0e4-1037ece8d2a0
# ╠═5fbe84f2-1c31-4fbe-910c-b0071de387b4
# ╠═fa31800f-a358-43ad-8c3c-eb0af2fae3b7
# ╠═11068dfe-b216-4a2a-a76f-a8dc683438f3
# ╠═cb60bfcb-f528-4231-83d4-cfb3ee372f7a
# ╟─332d1d1f-405c-4ab9-84bf-c9c856f6c3c7
