require 'write_xlsx'

class SpreadsheetService

  def generate_excel(users)
    # Create a new Excel workbook
    workbook = WriteXLSX.new('ruby.xlsx')
     # Add a new worksheet for user data
     user_worksheet = workbook.add_worksheet("Users")
    # Add and define a format
    format = workbook.add_format # Add a format
    format.set_bold
    format.set_color('red')
    format.set_align('center')

    
    # Add column headers
    user_worksheet.write_row(0, 0, ["Email", "Full Name"], format)
    
    # Iterate through each user and add their data as a new row
    users.each_with_index do |user, index|
      email = user.email || "No Email"
      full_name = user.full_name || "Anonymous"
      user_worksheet.write_row(index + 1, 0, [email, full_name])
    end
    
    # Close the workbook
    workbook.close
    
    # Return the Excel file as a binary string
    File.open('ruby.xlsx', 'rb').read
  end
end