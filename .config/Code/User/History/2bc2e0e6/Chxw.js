function doMagic() {
  const demo = document.getElementById('demo');
  demo.textContent = "✨ Magic happened! ✨";
  demo.style.color = "#f0a500";
}

function showInput() {
  const input = document.getElementById('user-input').value;
  const demo = document.getElementById('demo');
  demo.textContent = `You typed: ${input}`;
  demo.style.color = "#6fcf97";
}

const flash = document.getElementById('flashbang');
flash.addEventListener('click', () => {
	flash.classList.toggle('on');
	document.body.style.backgroundColor = flash.classList.contains('on') ? '#fff' : '#222';
});

const Switch = document.getElementById('switch');
Switch.addEventListener('click', () => {
	Switch.classList.toggle('on');
	Switch.textContent = Switch.classList.contains('on') ? 'ON' : 'OFF';
});

const swap = document.getElementById('swap');
swap.addEventListener('click', () => {
	window.location.href = 'test/index.html';
});

const numbers = document.getElementById('123')
numbers.addEventListener('click', () => {
  
});