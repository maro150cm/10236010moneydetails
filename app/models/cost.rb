class Cost < ActiveRecord::Base
    validates :cost_date, presence: { message: '請選擇花費日期' }
    validates :item, presence: { message: '請填寫花費細項' },
              format: {with: /\A([\u4e00-\u9fa5]{0,}|[A-Za-z]{0,}|[0-9]{0,})+$\z/ ,message:'細項格式錯誤'}
    validates :money, presence: { message: '請填寫花費金額' }
end
