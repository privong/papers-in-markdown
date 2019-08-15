--[[
Simple pandoc filter to handle the {{acknowledgments}} macro.

Copyright (C) 2018-2019 George C. Privon

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]--

return {
  {
    Str = function (elem)
        if elem.text == "{{acknowledgments}}" then
            if string.find(FORMAT, "latex") then
                return pandoc.RawInline("tex", "\\acknowledgments{")
            elseif string.find(FORMAT, "html") then
                return pandoc.RawInline("html", "<h1>Acknowledgements</h1>")
            else
                return elem
            end
        elseif elem.text == "{{end_acknowledgments}}" then
            if string.find(FORMAT, "latex") then
                return pandoc.RawInline("tex", "}")
            end
        end
    end,
  }
}
