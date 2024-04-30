# app/pdfs/report_pdf_generator.rb



class ReportPdfGenerator< Prawn::Document
    class << self
        def generate(reports)
            pdf = Prawn::Document.new
            pdf.text "Reports"
        
            # Define the table data as a 2D array
            table_data = [["ID", "Reason", "Details"]] # Table header
        
            # Populate the table data with report information
            reports.each do |report|
            table_data << [report.id, report.reason, report.details]
            end
        
            # Draw the table
            pdf.table(table_data, header: true, width: pdf.bounds.width) do |table|
            table.header = true
            table.row(0).font_style = :bold
            end
        
            pdf.render
        end

        def details_generate(reports)
            pdf = Prawn::Document.new
            pdf.text "Reports Details"
            # Define the table data as a 2D array
            table_data = [["ID", "Reason", "Details", "Comment", "Post Title", "Post Description"]] # Table header
            # Populate the table data with report information
            reports.each do |report|
            table_data << [report.id, report.reason, report.details, report.comment.body, report.post.title, report.post.description]
            end
            # Draw the table
            pdf.table(table_data, header:true, width: pdf.bounds.width) do |table|
                table.header = true
                table.row(0).font_style = :bold
            end
             pdf.render
        end
    end   
end