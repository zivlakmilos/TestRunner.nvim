M = {}

function M.setup(config)
	if not config then
		config = {}
	end
end

function M.run_test()
	local extension = vim.bo.filetype
	local command = nil

	if extension == "lua" then
		command = "call jobsend(b:terminal_job_id, \"nvim --headless -c 'PlenaryBustedDirectory tests'\\n\")"
	elseif extension == "javascript" or extension == "typescript" then
		command = 'call jobsend(b:terminal_job_id, "npm run test \\n")'
	end

	if command then
		vim.cmd("vsplit | terminal")
		vim.cmd(command)
	end
end

return M
