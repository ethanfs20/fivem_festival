// menu.js
document.addEventListener('DOMContentLoaded', function () {
    // Function to start the emitter
    function resumeMusic() {
        $.post('https://fivem_festival/resumeMusic', JSON.stringify({}));  // send a message to the LUA script
    }

    // Function to stop the emitter
    function pauseMusic() {
        $.post('https://fivem_festival/pauseMusic', JSON.stringify({}));  // send a message to the LUA script
    }

    // Function to start the festival
    function startFestival() {
        $.post('https://fivem_festival/startFestival', JSON.stringify({}));  // send a message to the LUA script
    }

    // Function to change the radio station for the emitter
    function changeRadioStation(station) {
        $.post('https://fivem_festival/changeRadioStation', JSON.stringify({ station: station }));  // send a message to the LUA script
    }

    // Function to close the menu
    function closeMenu() {
        $.post('https://fivem_festival/closeMenu', JSON.stringify({}));  // send a message to the LUA script
    }

    // Function to show the radio station selection
    function showRadioStations() {
        // Hide the main menu
        document.querySelector('.menu-container').style.display = 'none';

        // Show the radio station selection menu
        document.querySelector('.grid').style.display = 'grid';

        // Create the list of radio stations
        const radioContainer = document.querySelector('#radio-stations-list');

        // Clear the existing list
        radioContainer.innerHTML = '';

        // Add the radio stations to the list
        radioStations.forEach((station) => {
            const stationDiv = document.createElement('div');
            stationDiv.classList.add('station');

            const stationImage = document.createElement('img');
            stationImage.src = station.image; // Use the image URL from the object
            stationImage.alt = station.name;

            stationDiv.appendChild(stationImage);

            stationDiv.addEventListener('click', () => changeRadioStation(station.name));

            radioContainer.appendChild(stationDiv);
        });

        // Add the back button
        const backButton = document.createElement('button');
        backButton.id = 'backButtonRadio';
        backButton.textContent = 'Back';
        backButton.addEventListener('click', showMainMenu);
        radioContainer.appendChild(backButton);
    }

    function showMainMenu() {
        // Hide the radio station selection menu if it is open 
        document.querySelector('.grid').style.display = 'none';

        // Show the main menu
        document.querySelector('.menu-container').style.display = 'block';
    }

    // Handle button clicks
    document.getElementById('startButton').addEventListener('click', startFestival);
    document.getElementById('resumeButton').addEventListener('click', resumeMusic);
    document.getElementById('pauseButton').addEventListener('click', pauseMusic);
    document.getElementById('changeButton').addEventListener('click', showRadioStations);
    document.getElementById('closeButton').addEventListener('click', closeMenu);

    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.showUI) {
            document.querySelector('.menu-container').style.display = 'block';
        } else {
            document.querySelector('.menu-container').style.display = 'none';
        }
    });
    const radioStations = [
        { name: "RADIO_02_POP", image: "imgs/NonStopPopFM-GTAV-Logo.png" },
        { name: "RADIO_03_HIPHOP_NEW", image: "./imgs/RadioLosSantos-GTAV-Logo.png" },
        { name: "RADIO_09_HIPHOP_OLD", image: "./imgs/WestCoastClassics-GTAV-Logo.png" },
        { name: "RADIO_27_DLC_PRHEI4", image: "./imgs/MusicLockerRadio-GTAO-Logo.png" },
        { name: "RADIO_23_DLC_XM19_RADIO", image: "./imgs/IFruitRadio-GTAO-Logo.png" },
        { name: "RADIO_05_TALK_01", image: "./imgs/WCTR-GTAV-Logo.png" },
        { name: "RADIO_14_DANCE_02", image: "./imgs/FlyLoFM-GTAV-Logo.png" },
    ];

    radioStations.sort((a, b) => a.name.localeCompare(b.name));
});
