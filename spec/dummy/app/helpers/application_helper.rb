module ApplicationHelper
  def countries
    [{ name: 'Hong Kong', iso_code: 'HK' }, { name: 'Jamaica', iso_code: 'JM' }]
  end

  def options
    { theme: 'facebook', tokenValue: 'iso_code' }
  end
end
