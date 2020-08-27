# frozen_string_literal: true

#
# Copyright (c) 2020-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'snapshot_helper'
require 'spec_helper'
require 'excel_helper'

describe Portable::Writers::Spreadsheet do
  let(:dir)      { File.join('tmp', 'spec') }
  let(:filename) { File.join(*dir, "#{SecureRandom.uuid}.xlsx") }
  let(:document) { nil }
  let(:resolver) { Objectable.resolver(separator: '') }
  let(:time)     { Time.now.utc }

  subject { described_class.new(document, resolver: resolver) }

  describe 'snapshots' do
    snapshots.each do |snapshot|
      let(:document) { snapshot.document }

      specify snapshot.name do
        results = subject.write!(
          filename: filename,
          data_provider: snapshot.data_provider,
          time: time
        )

        actual_data   = read_xlsx_file(results.first.filename)
        expected_data = read_xlsx_file(snapshot.expected_filenames('spreadsheet').first)

        expect(actual_data).to match_array(expected_data)
      end
    end
  end
end
