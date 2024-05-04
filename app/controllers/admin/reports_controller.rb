class Admin::ReportsController < ApplicationController
    def index
      @reports = Report.all
    end

    def generate_pdf
        reports = Report.all
        pdf_data = ReportPdfGenerator.generate(reports)
        send_data pdf_data, filename: "reports.pdf", type: "application/pdf", disposition: "inline"
    end

    def generate_excel
      users = User.all
      spreadsheet_service = SpreadsheetService.new
      excel_data = spreadsheet_service.generate_excel(users)
      respond_to do |format|
        # format.xlsx { send_data excel_data, filename: "users.xlsx" }
        format.xlsx { send_data excel_data, filename: "users.xlsx", type: :xlsx }
      end
    end

    def details_generate_pdf
        reports = Report.includes(:post, :comment).all
        pdf_data = ReportPdfGenerator.details_generate(reports)
        send_data pdf_data, filename: "reports_detail.pdf", type: "application/pdf", disposition: "inline"
    end
  
  end
  