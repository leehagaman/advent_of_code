### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 42c2e6ce-02af-4f4e-89ea-ebef9be3c6d3
using LinearAlgebra

# ╔═╡ 430f7e0a-af4d-11ef-1c81-7fcb187c67ce
md"# Day 0"

# ╔═╡ 33ea55ec-ca16-4247-baf0-92af96fc537c
md"## Input"

# ╔═╡ fe3dad1d-aaf8-4097-a9dd-2371ce79ee11
filename = "input_day_00.txt"

# ╔═╡ b39ab739-962d-4666-b886-59ea8ae499ee
open(filename) do f
    global input_str = read(f, String)
end

# ╔═╡ 1ed013bb-b45b-4665-b468-f7395091502c
input_split = split(input_str, "\n")

# ╔═╡ fed9547d-5fb7-4cb8-a3e8-3c623ba551bc
input_clean = filter(s -> s != "", input_split)

# ╔═╡ 2adb8b48-ab90-48cc-9cf8-841afa345ccc
input_nums = map(s -> parse(Int, s), input_clean)

# ╔═╡ 1604072b-43c3-4e8c-a676-a8dbff48cd9f
for (idx, val) in enumerate(input_nums)
	println("index $idx, value '$val'")
end

# ╔═╡ b98007d5-74df-4397-a96e-629a64fa2142
md"## Computation"

# ╔═╡ af8c3081-1c00-4af3-95d3-c9609c10732b
sum(input_nums)

# ╔═╡ 0549ad2e-8e62-46f1-84fe-5bc08344bb30
begin
	global diffs = []
	for i in 1 : length(input_nums) - 1
		push!(diffs, input_nums[i+1] - input_nums[i])
	end
end

# ╔═╡ 580c8130-458c-4fa5-86a5-38b4b0602e73
diffs

# ╔═╡ f1772523-b1b1-45fd-a486-33ce12dd1740
md"# Day 0 2D"

# ╔═╡ 22c655e4-1b3b-496c-9054-260d7178ee0e
md"## Input"

# ╔═╡ e5fa2757-612a-481d-9323-22a322294605
filename_2d = "input_day_00_2d.txt"

# ╔═╡ 2cdb8e84-f601-4abb-bdc8-c0c00106718d
open(filename_2d) do f
    global input_str_2d = read(f, String)
end

# ╔═╡ 27e00fd8-d78d-4225-8dad-640c0cad0b14
input_rows_str_2d = split(input_str_2d, "\n")

# ╔═╡ 16c9046d-4020-4dd2-b9b6-50408488cc0b
input_rows_str_2d_clean = filter(s -> s != "", input_rows_str_2d)

# ╔═╡ cac7dfaa-6a6d-405c-8639-3172528a2efc
input_2d_strs = map(x -> split(x, " "), input_rows_str_2d_clean)

# ╔═╡ 615464a8-2167-4bb3-ba43-712b0c0eb18e
input_2d = map(row -> map(x -> parse(Int, x), row), input_2d_strs)

# ╔═╡ cff0adc4-5312-4757-bc0f-fecd68d3b662
input_2d

# ╔═╡ 17fcd068-bdad-439a-8629-4a8adb72c17a
input_mat = transpose(hcat(input_2d...))

# ╔═╡ d200feba-c109-4006-9d20-8d81307d35db
input_mat_square = input_mat[1:4, 1:4]

# ╔═╡ c8a71009-1133-4a2a-be3d-95339e9636d9
det(input_mat_square)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.1"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╠═430f7e0a-af4d-11ef-1c81-7fcb187c67ce
# ╠═33ea55ec-ca16-4247-baf0-92af96fc537c
# ╠═fe3dad1d-aaf8-4097-a9dd-2371ce79ee11
# ╠═b39ab739-962d-4666-b886-59ea8ae499ee
# ╠═1ed013bb-b45b-4665-b468-f7395091502c
# ╠═fed9547d-5fb7-4cb8-a3e8-3c623ba551bc
# ╠═2adb8b48-ab90-48cc-9cf8-841afa345ccc
# ╠═1604072b-43c3-4e8c-a676-a8dbff48cd9f
# ╠═b98007d5-74df-4397-a96e-629a64fa2142
# ╠═af8c3081-1c00-4af3-95d3-c9609c10732b
# ╠═0549ad2e-8e62-46f1-84fe-5bc08344bb30
# ╠═580c8130-458c-4fa5-86a5-38b4b0602e73
# ╠═f1772523-b1b1-45fd-a486-33ce12dd1740
# ╠═22c655e4-1b3b-496c-9054-260d7178ee0e
# ╠═e5fa2757-612a-481d-9323-22a322294605
# ╠═2cdb8e84-f601-4abb-bdc8-c0c00106718d
# ╠═27e00fd8-d78d-4225-8dad-640c0cad0b14
# ╠═16c9046d-4020-4dd2-b9b6-50408488cc0b
# ╠═cac7dfaa-6a6d-405c-8639-3172528a2efc
# ╠═615464a8-2167-4bb3-ba43-712b0c0eb18e
# ╠═cff0adc4-5312-4757-bc0f-fecd68d3b662
# ╠═17fcd068-bdad-439a-8629-4a8adb72c17a
# ╠═d200feba-c109-4006-9d20-8d81307d35db
# ╠═42c2e6ce-02af-4f4e-89ea-ebef9be3c6d3
# ╠═c8a71009-1133-4a2a-be3d-95339e9636d9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
