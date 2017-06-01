require 'rails_helper'

feature "parking", :type => :feature do

  scenario "guest parking" do
    # Step 1

    visit "/"            # 浏览首页

    save_and_open_page # 这会存下测试当时的 HTML 页面


    expect(page).to have_content("一般费率") # 检查 HTML 中要出现 "一般费率" 文字


    # Step 2

    click_button "开始计费" # 按这个按钮

    # Step 3:

    click_button "结束计费" # 按这个按钮

    # Step 4: 看到费用画面

    expect(page).to have_content("¥2.00")  # 检查 HTML 中要出现 ¥2.00 文字

  end

end
