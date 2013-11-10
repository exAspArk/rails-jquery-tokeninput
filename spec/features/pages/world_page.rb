class WorldPage < Struct.new(:path)
  include Capybara::DSL

  def visit_page
    visit path
    self
  end

  def enter_key_code_to_tokeninput(key_code)
    tokeninput.click
    page.execute_script %Q{
      var e = jQuery.Event('keydown', { which: #{ key_code } });
      $('##{ tokeninput['id'] }').val(String.fromCharCode(e.which));
      $('##{ tokeninput['id'] }').trigger(e);
    }
  end

  def select_first_token
    first('.token-input-selected-dropdown-item-facebook').click
  end

  def dropdown
    find('div.token-input-dropdown-facebook')
  end

  def with_dropdown?
    page.has_css?(".#{ dropdown['class'].split(' ').join('.') }")
  end

  def selected_token
    find('ul.token-input-list-facebook')
  end

  def with_selected_token?
    page.has_css?(".#{ selected_token['class'].split(' ').join('.') }")
  end

  def pass_data
    click_button('Create World')
  end

  def response
    JSON.parse body.gsub('<html><head></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">', '').
                    gsub('</pre></body></html>', '')
  end

private

  def tokeninput
    find('#token-input-world_countries')
  end
end
