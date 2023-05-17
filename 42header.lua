function insertHeader()
   local header = {
   "/* ******************************************************************************** */",
   "/*                                                                           		*/",
   "/*                                                        		  :::     :::::::: */",
   "/*   file_name.c                               					:+:     :+:     :+: */",
   "/*                                                    		 +:+ +:+         +:+   */",
   "/*   By: author_name <mail@>        					   +#+  +:+       +#+      */",
   "/*                                                		+#+#+#+#+#+    +#+         */",
   "/*   Created: " .. os.date("%Y/%m/%d %H:%M:%S") .. " by name                      #+#     #+#          */",
   "/*   Updated: " .. os.date("%Y/%m/%d %H:%M:%S") .. " by name                    ###     ########.pt    */",
   "/*                                                                                  */",
   "/* ******************************************************************************** */"
}


   local current_line = vim.api.nvim_win_get_cursor(0)[1]
   local line_count = #header

   -- Insertar el encabezado en el buffer
   vim.api.nvim_buf_set_lines(0, current_line -1,current_line -1, false, header)

   -- Mover el cursor a la línea donde estaba antes de insertar el encabezado
   local new_line = current_line + line_count
   local buffer_line_count = vim.api.nvim_buf_line_count(0)
   if new_line > buffer_line_count then
   		new_line = buffer_line_count
   end
   vim.api.nvim_win_set_cursor(0, {new_line, 0})
end

vim.cmd([[
augroup insertHeaderResize
	autocmd!
	autocmd VimResized *lua insertHeader()

augroup END
]])
