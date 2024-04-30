class Admin::ReportsController < ApplicationController
    def index
      @reports = Report.all
    end

    def generate_pdf
        reports = Report.all
        pdf_data = ReportPdfGenerator.generate(reports)
        send_data pdf_data, filename: "reports.pdf", type: "application/pdf", disposition: "inline"
    end

    def details_generate_pdf
        reports = Report.includes(:post, :comment).all
        pdf_data = ReportPdfGenerator.details_generate(reports)
        send_data pdf_data, filename: "reports_detail.pdf", type: "application/pdf", disposition: "inline"
    end
  
  end
  