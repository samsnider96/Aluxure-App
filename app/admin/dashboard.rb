ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class:</strong> "blank_slate_container", id: "dashboard_default_message" do
  #     span class:</strong> "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end


    columns do
      column do
        panel "Overall Metrics" do
          ul class: "no_bullets" do
            li "<strong>Total Number of Users:</strong> #{User.count}".html_safe
            li "<strong>Total Number of Items:</strong> #{Item.count}".html_safe
            li "<strong>Total Number of Appointment Requests:</strong> #{AppointmentRequest.count}".html_safe
            li "<strong>Total Number of Companies:</strong> #{Company.count}".html_safe
            li "<strong>Total Number of Approved Appointment Requests:</strong> #{AppointmentRequest.where(approved: true).count}".html_safe
            li "<strong>Total Number of Declined Appointment Requests:</strong> #{AppointmentRequest.where(declined: true).count}".html_safe
            li "<strong>Total Number of Pending Appointment Requests:</strong> #{AppointmentRequest.where(approved: false, declined: false).count}".html_safe
          end
        end
      end

      column do
        panel "Today" do
          ul class: "no_bullets" do
            li "<strong>Users:</strong> #{User.where("created_at >= ?", Time.zone.now.beginning_of_day).count}" .html_safe
            li "<strong>Items:</strong> #{Item.where("created_at >= ?", Time.zone.now.beginning_of_day).count}".html_safe
            li "<strong>Appointment Requests:</strong> #{AppointmentRequest.where("created_at >= ?", Time.zone.now.beginning_of_day).count}".html_safe
            li "<strong>Companies:</strong> #{Company.where("created_at >= ?", Time.zone.now.beginning_of_day).count}".html_safe
            li "<strong>Approved Appointment Requests:</strong> #{AppointmentRequest.where("created_at >= ? AND approved", Time.zone.now.beginning_of_day).where(approved: true).count}".html_safe
            li "<strong>Declined Appointment Requests:</strong> #{AppointmentRequest.where("created_at >= ?", Time.zone.now.beginning_of_day).where(declined: true).count}".html_safe
            li "<strong>Pending Appointment Requests:</strong> #{AppointmentRequest.where("created_at >= ?", Time.zone.now.beginning_of_day).where(approved: false, declined: false).count}".html_safe
          end
        end
      end

      column do
        panel "This Week" do
          ul class: "no_bullets" do
            li "<strong>Users:</strong></strong> #{User.where('created_at >= ?', 1.week.ago).count}".html_safe
            li "<strong>Items:</strong> #{Item.where('created_at >= ?', 1.week.ago).count}".html_safe
            li "<strong>Appointment Requests:</strong> #{AppointmentRequest.where('created_at >= ?', 1.week.ago).count}".html_safe
            li "<strong>Companies:</strong> #{Company.where('created_at >= ?', 1.week.ago).count}".html_safe
            li "<strong>Approved Appointment Requests:</strong> #{AppointmentRequest.where('created_at >= ?', 1.week.ago).where(approved: true).count}".html_safe
            li "<strong>Declined Appointment Requests:</strong> #{AppointmentRequest.where('created_at >= ?', 1.week.ago).where(declined: true).count}".html_safe
            li "<strong>Pending Appointment Requests:</strong> #{AppointmentRequest.where('created_at >= ?', 1.week.ago).where(approved: false, declined: false).count}".html_safe
          end
        end
      end

      column do
        panel "This Month" do
          ul class: "no_bullets" do
            li "<strong>Users:</strong> #{User.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).count}".html_safe
            li "<strong>Items:</strong> #{Item.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).count}".html_safe
            li "<strong>Appointment Requests:</strong> #{AppointmentRequest.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).count}".html_safe
            li "<strong>Companies:</strong> #{Company.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).count}".html_safe
            li "<strong>Approved Appointment Requests:</strong> #{AppointmentRequest.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).where(approved: true).count}".html_safe
            li "<strong>Declined Appointment Requests:</strong> #{AppointmentRequest.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).where(declined: true).count}".html_safe
            li "<strong>Pending Appointment Requests:</strong> #{AppointmentRequest.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).where(approved: false, declined: false).count}".html_safe
          end
        end
      end
    end

    columns do
      column do
        panel "New Companies" do
          table_for Company.order("created_at desc").limit(5) do
            column :name do |company|
              link_to company.name, [:admin, company]
            end
            column :phone
            column :email
            column :url
            column :annual_revenue
            column :number_of_locations
            column :description
          end
          strong { link_to "View All Companies", admin_companies_path }
        end
      end
    end

  end 
end
