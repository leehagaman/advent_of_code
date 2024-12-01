### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 2e619044-4010-4143-a027-3f4ea7361561
using DataStructures

# ╔═╡ 50238ddc-ce88-433a-a1f8-f7582d4e7f07
using LinearAlgebra

# ╔═╡ e6639660-afa0-11ef-0de6-a97c47018cfa
md"# Day 1"

# ╔═╡ 82f8979a-a869-465c-a573-59a1ad2b89bc
md"## Part 1"

# ╔═╡ 98ac074e-29b0-4d6a-b7ec-2b318b4f3dbb
md"## Part 2"

# ╔═╡ 61d65bfb-2193-469b-8b0a-6ee695a49e7b
md"## Input"

# ╔═╡ ae0762d8-9218-4446-b130-f0daa43de40e
filename = "input_day_01.txt"

# ╔═╡ e44a5803-3d1f-4163-9443-f9b8191a8323
open(filename) do f
    global input_str = read(f, String)
end

# ╔═╡ 16c66b67-eba0-44de-a0e4-1037ece8d2a0
input_rows = split(input_str, "\n")

# ╔═╡ 5fbe84f2-1c31-4fbe-910c-b0071de387b4
input_rows_clean = filter(s -> s != "", input_rows)

# ╔═╡ fa31800f-a358-43ad-8c3c-eb0af2fae3b7
input_row_pairs = map(x -> split(x), input_rows_clean)

# ╔═╡ 11068dfe-b216-4a2a-a76f-a8dc683438f3
input_row_nums = map(row -> map(x -> parse(Int, x), row), input_row_pairs)

# ╔═╡ cb60bfcb-f528-4231-83d4-cfb3ee372f7a
num = length(input_row_nums)

# ╔═╡ fed9233d-d403-4735-871f-f8507e70941f
begin
	input_1 = []
	input_2 = []
	for i in 1:num
		push!(input_1, input_row_nums[i][1])
		push!(input_2, input_row_nums[i][2])
	end
end

# ╔═╡ 13bc8a6b-5394-4014-a4c7-cff4a8ef80ac
input_1

# ╔═╡ 86e936de-b64f-4a04-bd3b-6eae9ca5f9d9
input_2

# ╔═╡ 2a5c33f8-014e-421b-897b-4eb6a99c9272
begin
	global sorted_input_1 = sort(input_1)
	global sorted_input_2 = sort(input_2)
end

# ╔═╡ cd726591-f82d-4f17-8acb-018a4faaa58a
diffs = map(x -> abs(x[1] - x[2]), zip(sorted_input_1, sorted_input_2))

# ╔═╡ 802d88c8-de4a-4384-a3cf-0d3839e35ca4
sum(diffs)

# ╔═╡ 8cde72eb-8dd0-49b1-86a1-beb9f43b68a0
counts = counter(input_2)

# ╔═╡ fa40c84d-1186-4edd-aa02-0ec9bbd4e58b
input_1_in_input_2_counts_arr = map(x -> counts[x], input_1)

# ╔═╡ f14449a0-50de-4ed9-9cc0-ef2d2b67992a
similarities = input_1.*input_1_in_input_2_counts_arr

# ╔═╡ 58c9db01-9fb2-45a3-8c9d-8c258c783be0
sum(similarities)

# ╔═╡ 332d1d1f-405c-4ab9-84bf-c9c856f6c3c7
md"## Imports"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataStructures = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[compat]
DataStructures = "~0.18.20"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.1"
manifest_format = "2.0"
project_hash = "1495246fa3eb9d83a4904f7b1fd9e60aa920e095"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "8ae8d32e09f0dcf42a36b90d4e17f5dd2e4c4215"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.16.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "1d0a14036acb104d9e89698bd408f63ab58cdc82"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.20"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OrderedCollections]]
git-tree-sha1 = "12f1439c4f986bb868acda6ea33ebc78e19b95ad"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.7.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╟─e6639660-afa0-11ef-0de6-a97c47018cfa
# ╠═13bc8a6b-5394-4014-a4c7-cff4a8ef80ac
# ╠═86e936de-b64f-4a04-bd3b-6eae9ca5f9d9
# ╟─82f8979a-a869-465c-a573-59a1ad2b89bc
# ╠═2a5c33f8-014e-421b-897b-4eb6a99c9272
# ╠═cd726591-f82d-4f17-8acb-018a4faaa58a
# ╠═802d88c8-de4a-4384-a3cf-0d3839e35ca4
# ╟─98ac074e-29b0-4d6a-b7ec-2b318b4f3dbb
# ╠═8cde72eb-8dd0-49b1-86a1-beb9f43b68a0
# ╠═fa40c84d-1186-4edd-aa02-0ec9bbd4e58b
# ╠═f14449a0-50de-4ed9-9cc0-ef2d2b67992a
# ╠═58c9db01-9fb2-45a3-8c9d-8c258c783be0
# ╟─61d65bfb-2193-469b-8b0a-6ee695a49e7b
# ╠═ae0762d8-9218-4446-b130-f0daa43de40e
# ╠═e44a5803-3d1f-4163-9443-f9b8191a8323
# ╠═16c66b67-eba0-44de-a0e4-1037ece8d2a0
# ╠═5fbe84f2-1c31-4fbe-910c-b0071de387b4
# ╠═fa31800f-a358-43ad-8c3c-eb0af2fae3b7
# ╠═11068dfe-b216-4a2a-a76f-a8dc683438f3
# ╠═cb60bfcb-f528-4231-83d4-cfb3ee372f7a
# ╠═fed9233d-d403-4735-871f-f8507e70941f
# ╟─332d1d1f-405c-4ab9-84bf-c9c856f6c3c7
# ╠═2e619044-4010-4143-a027-3f4ea7361561
# ╠═50238ddc-ce88-433a-a1f8-f7582d4e7f07
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
