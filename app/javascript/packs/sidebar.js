document.addEventListener('turbolinks:load', () => {
  const menuButton = document.getElementById('hamburger-menu');
  const sideNav = document.getElementById('side-nav');
  const closeButton = document.getElementById('close-menu');

  menuButton.addEventListener('click', () => {
    sideNav.classList.toggle('active');
  });

  closeButton.addEventListener('click', () => {
    sideNav.classList.remove('active'); // クラスを削除してメニューを閉じる
  });
});