document.addEventListener('turbolinks:load', () => {
  const menuButton = document.getElementById('hamburger-menu');
  const sideNav = document.getElementById('side-nav');
  const closeButton = document.getElementById('close-menu'); // 閉じるボタンの要素を取得

  // メニューボタンのクリックイベント
  menuButton.addEventListener('click', () => {
    sideNav.classList.toggle('active');
  });

  // 閉じるボタンのクリックイベント
  closeButton.addEventListener('click', () => {
    sideNav.classList.remove('active'); // クラスを削除してメニューを閉じる
  });
});