class HomePage < Struct.new(:path)
  include Capybara::DSL

  def visit_page
    visit path
    self
  end

  def enter_character(key_code)
    tokeninput.click
    page.execute_script %Q{
      var e = jQuery.Event('keydown');
      e.which = #{ key_code };
      $('##{ tokeninput_id }').val(String.fromCharCode(e.which));
      $('##{ tokeninput_id }').trigger(e);
    }
  end

private

  def tokeninput
    find("##{ tokeninput_id }")
  end

  def tokeninput_id
    'token-input-countries'
  end
end
