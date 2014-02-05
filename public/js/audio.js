var Context, audioContext, createOscillator, isOn, oscillator, playExponential, playLinear, setFrequency, toggle;

Context = window.AudioContext || window.webkitAudioContext;

audioContext = new Context();

createOscillator = function() {
  var oscillator;
  oscillator = audioContext.createOscillator();
  oscillator.connect(audioContext.destination);
  return oscillator;
};

oscillator = createOscillator();

setFrequency = function(frequency) {
  return oscillator.frequency.value = frequency;
};

toggle = function() {
  switch (oscillator.playbackState) {
    case oscillator.UNSCHEDULED_STATE:
      return oscillator.start(0);
    case oscillator.PLAYING_STATE:
      oscillator.stop();
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
    oscillator1.stop();
    oscillator2 = createOscillator();
    oscillator2.frequency.value = startFrequency * 2;
    oscillator2.start();
    return setTimeout((function() {
      return oscillator2.stop();
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
    oscillator1.stop();
    oscillator2 = createOscillator();
    oscillator2.frequency.value = startFrequency + 100;
    oscillator2.start();
    return setTimeout((function() {
      return oscillator2.stop();
    }), 500);
  }), 500);
};

isOn = function() {
  return oscillator.playbackState === 1;
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
