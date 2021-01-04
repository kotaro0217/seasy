class Category < ActiveHash::Base
  self.data = [
     { id: 1, name: '---' },
     { id: 6, name: '本・音楽・ゲーム' },    
     { id: 7, name: 'おもちゃ・ホビー・グッズ' },   
     { id: 8, name: '家電・スマホ・カメラ' },    
     { id: 9, name: 'スポーツ・レジャー' },    
     { id: 10, name: 'ハンドメイド' },    
     { id: 11, name: 'その他' },
   ]    
     include ActiveHash::Associations
end
