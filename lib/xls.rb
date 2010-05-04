
class XLS
  def XLS.render_xls(object_class, array)
    require 'spreadsheet'

    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet

    columns = object_class.column_names - ['created_at', 'updated_at']
    columns.each do |column|
      sheet.last_row.push object_class.human_attribute_name(column)
    end

    array.each do |item|
      row = sheet.row(sheet.last_row_index() + 1)
      columns.each do |column|
        value = item.send(column)
        row.push value
      end
    end

    xlspath = '/tmp/temp.xls'
    book.write xlspath
    return xlspath
  end
end
