var capsLockEnabled = null;

function getChar(e) {

  if (e.which == null) {
    return String.fromCharCode(e.keyCode); // IE
  }
  if (e.which != 0 && e.charCode != 0) {
    return String.fromCharCode(e.which); // rest
  }

  return null;
}

document.onkeydown = function(e) {
  e = e || event;

  if (e.keyCode == 20 && capsLockEnabled !== null) {
    capsLockEnabled = !capsLockEnabled;
  }
}

document.onkeypress = function(e) {
  e = e || event;

  var chr = getChar(e);
  if (!chr) return; // special key

  if (chr.toLowerCase() == chr.toUpperCase()) {
    // caseless symbol, like whitespace 
    // can't use it to detect Caps Lock
    return;
  }

  capsLockEnabled = (chr.toLowerCase() == chr && e.shiftKey) || (chr.toUpperCase() == chr && !e.shiftKey);
}

/**
 * Check caps lock 
 */
function checkCapsWarning() {
  document.getElementById('caps').style.display = capsLockEnabled ? 'block' : 'none';
}

function removeCapsWarning() {
  document.getElementById('caps').style.display = 'none';
}