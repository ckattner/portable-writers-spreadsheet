# frozen_string_literal: true

#
# Copyright (c) 2020-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'benchmark'
require 'fast_excel'
require 'portable'

module Portable
  module Writers
    # Can write documents to an Excel file.
    class Spreadsheet < Base
      def write!(filename:, data_provider: Data::Provider.new, time: Time.now.utc)
        raise ArgumentError, 'filename is required' if filename.to_s.empty?

        time_in_seconds = Benchmark.measure do
          ensure_directory_exists(filename)

          write_file(filename, data_provider, time)
        end.real

        [Result.new(filename, time_in_seconds)]
      end

      private

      def write_file(filename, data_provider, time)
        workbook = FastExcel.open(filename, constant_memory: true)

        document.sheets.map do |sheet|
          data_source = data_provider.data_source(sheet.data_source_name)
          worksheet   = add_worksheet(workbook, sheet)

          write_head(worksheet, sheet, data_source)
          write_data_table(worksheet, sheet, data_source, time)
          write_foot(worksheet, sheet, data_source)
        end

        workbook.close
      end

      def write_head(worksheet, sheet, data_source)
        sheet.header_rows.each { |row| worksheet.append_row(row) }

        data_source.header_rows.each { |row| worksheet.append_row(row) }
      end

      def write_data_table(worksheet, sheet, data_source, time)
        row_renderer = sheet_renderer.row_renderer(sheet.name, data_source.fields)

        worksheet.append_row(row_renderer.headers) if sheet.include_headers?

        data_source.data_rows.each do |row|
          worksheet.append_row(row_renderer.render(row, time))
        end
      end

      def write_foot(worksheet, sheet, data_source)
        data_source.footer_rows.each { |row| worksheet.append_row(row) }

        sheet.footer_rows.each { |row| worksheet.append_row(row) }
      end

      def add_worksheet(workbook, sheet)
        name = sheet.name.to_s.empty? ? 'Sheet1' : sheet.name

        workbook.add_worksheet(name)
      end
    end
  end
end
