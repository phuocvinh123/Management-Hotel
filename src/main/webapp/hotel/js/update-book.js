function setupRoomOptions(elementId) {
    var ele = document.getElementById(elementId);
    if (ele) {
        ele.addEventListener("change", (event) => {
            updateRoomOptions(elementId);
        });
    }
}
function updateRoomOptions(elementId) {
    var selectedRooms = parseInt(document.getElementById(elementId).value, 10) || 0;
    var roomOptionsContainer = document.getElementById('roomOptions');
    roomOptionsContainer.innerHTML = '';
    for (var i = 1; i <= selectedRooms; i++) {
        var roomOption = document.createElement('div');
        roomOption.className = 'select-option';
        roomOption.innerHTML = '<label for="guest">Guests in Room ' + i + ':</label>' +
            '<select name="guests' + i + '" class="select-room-detail">' +
            '<option value="1">1 Adult</option>' +
            '<option value="2">2 Adults</option>' +
            '<option value="3">3 Adults</option>' +
            '<option value="4">4 Adults</option>' +
            '</select>';
        roomOptionsContainer.appendChild(roomOption);
    }
}
setupRoomOptions('roomChoose');