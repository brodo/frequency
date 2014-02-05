var Context, audioContext, createOscillator, isOn, oscillator, playExponential, playLinear, setFrequency, toggle;

Context = window.AudioContext || window.webkitAudioContext;

audioContext = new Context();

createOscillator = function() {
  var oscillator;
  oscillator = audioContext.createOscillator();
  oscillator.connect(audioContext.destination);
  oscillator.started = false;
  return oscillator;
};

oscillator = createOscillator();

setFrequency = function(frequency) {
  return oscillator.frequency.value = frequency;
};

toggle = function() {
  if (!oscillator.started) {
    oscillator.start(0);
    return oscillator.started = true;
  } else {
    oscillator.stop(0);
    return oscillator = createOscillator();
  }
};

playExponential = function(startFrequency) {
  var oscillator1;
  oscillator1 = createOscillator();
  oscillator1.frequency.value = startFrequency;
  oscillator1.start(0);
  return setTimeout((function() {
    var oscillator2;
    oscillator1.stop(0);
    oscillator2 = createOscillator();
    oscillator2.frequency.value = startFrequency * 2;
    oscillator2.start(0);
    return setTimeout((function() {
      return oscillator2.stop(0);
    }), 500);
  }), 500);
};

playLinear = function(startFrequency) {
  var oscillator1;
  oscillator1 = createOscillator();
  oscillator1.frequency.value = startFrequency;
  oscillator1.start(0);
  return setTimeout((function() {
    var oscillator2;
    oscillator1.stop(0);
    oscillator2 = createOscillator();
    oscillator2.frequency.value = startFrequency + 100;
    oscillator2.start(0);
    return setTimeout((function() {
      return oscillator2.stop(0);
    }), 500);
  }), 500);
};

isOn = function() {
  return oscillator.started;
};

window.lesson = {
  demo1: {
    setFrequency: setFrequency,
    toggle: toggle,
    isOn: isOn
  },
  demo2: {
    playExponential: playExponential
  },
  demo3: {
    playLinear: playLinear
  }
};
