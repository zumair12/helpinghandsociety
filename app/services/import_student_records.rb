# frozen_string_literal: true

module ImportStudentRecords
  attr_accessor :file

  def data(file, sheet_index)
    @file = file

    @data ||= begin
      sheet = interface.sheet(sheet_index.to_i)

      sheet.each(sheet_headers(sheet_index.to_i)).each_with_object([]) do |hash, data|
        data << hash if hash["name"].present?
      end
    end
  end

  def sheet_headers(sheet_index)
    Hash[file_column_names(sheet_index).map { |e| [e&.parameterize(separator: "_"), e] }].except(nil)
  end

  def file_column_names(selected_sheet = 0)
    @file_column_names ||= interface.sheet(selected_sheet).row(1)
  rescue StandardError => e
    raise_inappropriate_headers!(selected_sheet, e.message)
  end

  def interface
    @interface ||= Roo::Spreadsheet.open @file
  end

  def sheets_names
    @sheets_names ||= interface.sheets
  end

  def raise_inappropriate_headers!(sheet_index = 0, message)
    raise StandardError, I18n.t("subscriptions.empty_headers", sheet_index: sheet_index.to_i + 1, message:)
  end
end
