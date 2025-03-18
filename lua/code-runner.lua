require('code_runner').setup {
	mode = "float",
	focus = true,
	startinsert = false,
	term = {
		position = "bot",
		size = 20,
	},
	float = {
				close_key = "<ESC>",
				-- Window border (see ':h nvim_open_win')
				border = "rounded",
				-- Num from `0 - 1` for measurements
				height = 0.8,
				width = 0.8,
				x = 0.5,
				y = 0.5,
				
				-- Highlight group for floating window/border (see ':h winhl')
				border_hl = "FloatBorder",
				float_hl = "Normal",
				
				-- Transparency (see ':h winblend')
				blend = 0,
		},
	project = {
		["~/deno/example"] = {
			name = "ExapleDeno",
			description = "Project with deno using other command",
			file_name = "http/main.ts",
			command = "deno run --allow-net"
		},
		["/home/zzlinus/dev/oscomp/2024/qemu_instrument"] = {
			name = "qemu",
			description = "qemu",
			command = "make -C target/loongarch"
		},
		["/home/zzlinus/dev/cpp/autoaim/OpenRM2024"] = {
			name = "qemu",
			description = "qemu",
			command = "cd build && cmake .. && make -j15"
		},
		["/home/zzlinus/dev/cpp/autoaim/TJURM2024"] = {
			name = "qemu",
			description = "qemu",
			command = "cd build && cmake .. && make -j15"
		},
		["/home/zzlinus/dev/inter/kernel/src/trusted_kernel"] = {
			name = "qemu",
			description = "qemu",
			command = "cargo build"
		},
		["/home/zzlinus/dev/inter/capability"] = {
			name = "cap",
			description = "cap",
			command = "cargo run"
		},
		["/home/zzlinus/dev/inter/cap"] = {
			name = "cap",
			description = "cap",
			command = "cargo run"
		},
		["/home/zzlinus/dev/oscomp/2024/qemu_instrument/target/loongarch"] = {
			name = "qemu",
			description = "qemu",
			command = "make -C target/loongarch"
		},
		["/home/zzlinus/dev/gkd/rm2023-infantry"] = {
			name = "bgfx project",
			description = "bgfx cpp dev",
			command = "./flash.sh"
		},
		["/home/zzlinus/dev/gkd/rm2023-infantry_myver"] = {
			name = "ueberzug nested tmux bug fixing",
			description = "",
			command = "./flash.sh"
		},
		["/home/zzlinus/Dev/School/CPP/COVID"] = {
			name = "covid",
			description = "covid",
			command = "cd build && cmake .. && make && ./covid"
		},
		["/home/zzlinus/dev/rust/kernel"] = {
			name = "inter",
			description = "inter",
			command = "make rust_lib"
		},
		["/home/zzlinus/dev/go/can_tui"] = {
			name = "can",
			description = "can tool",
			command = "onefetch && go build && ./can_tui"
		},
		["/home/zzlinus/dev/cpp/wjk"] = {
			name = "wjk",
			description = "ruiji go",
			command = "cd build && make -j && ./wjk"
		},
		["/home/zzlinus/dev/go/ruiji_go"] = {
			name = "ruiji",
			description = "ruiji go",
			command = "onefetch && go run main.go"
		},
		["/home/zzlinus/dev/cpp/NeoRMControl_OneForALL"] = {
			name = "rmcontrol",
			description = "rmcontrol",
			command = "make mini-pc"
		},
		["/home/zzlinus/dev/cpp/rm_neobubing"] = {
			name = "neo bubing",
			description = "neo bubing",
			command = "make clean && make -j && make run"
		},
		["/home/zzlinus/dev/cpp/rm_neobubing_controller"] = {
			name = "neo bubing ctrl",
			description = "neo bubing",
			command = "make -j8 && make run"
		},
		["/home/zzlinus/dev/cpp/hidraylib"] = {
			name = "covid",
			description = "covid",
			command = "make all"
		},
		["~/Dev/CPP/OpenGLSomething/chap4"] = {
			name = "OpenGL Chap4",
			description = "Project with make file",
			command = "cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make && cd .. && ./build/main"
		}
	},
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},

}

vim.keymap.set('n', '<leader>cr', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>cf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>cp', ':CRProjects<CR>', { noremap = true, silent = false })
