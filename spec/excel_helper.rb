# frozen_string_literal: true

#
# Copyright (c) 2020-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'roo'

def read_xlsx_file(filename)
  workbook = Roo::Spreadsheet.open(filename)

  rows_by_sheet = workbook.sheets.each_with_object({}) do |sheet, memo|
    memo[sheet] = []

    workbook.sheet(sheet).each_row_streaming do |row|
      memo[sheet] << row.map(&:value)
    end
  end

  workbook.close

  rows_by_sheet
end
