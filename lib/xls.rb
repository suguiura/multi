
class XLS
  def XLS.render_xls(array)
    require 'spreadsheet'

    columns = array.first.attributes.keys(&:to_sym)

    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet

    row = sheet.last_row
    columns.each do |column|
      row.push column.to_s
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
