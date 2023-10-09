const tableContainer = document.getElementById('payoff-tables')

const tables = [
    {
        img: "https://kimdukgyoo.github.io/images/image2.jpg",
        text: "You can earn positive payoffs when you and the other participant make different decisions.",
        name: "If you think you are ABOVE the average"
    },
    {
        img: "https://kimdukgyoo.github.io/images/image3.jpg",
        text: "You can earn positive payoffs when you and the other participant make different decisions.",
        name: "If you think you are BELOW the average"
    }
]

function populateDisplay() {
    tables.forEach(table => {
        const cardElement = document.createElement('div')
        cardElement.classList.add('card')

        cardElement.addEventListener('mouseover', showCard)
        cardElement.addEventListener('mouseleave', blurCard)

        const imageContainer = document.createElement('div')
        imageContainer.classList.add('image-container')
        const imageElement = document.createElement('img')
        imageElement.setAttribute('src', table.img)
        imageContainer.append(imageElement)

        const paragraphElement = document.createElement('p')
        paragraphElement.textContent = table.text
        const nameContainer = document.createElement('div')
        nameContainer.classList.add('name-container')
        nameContainer.textContent = table.name

        cardElement.append(imageContainer, paragraphElement, nameContainer)

        tableContainer.append(cardElement)
    })
}
populateDisplay()

function showCard () {
    this.classList.add('active')
}


function blurCard () {
    this.classList.remove('active')
}
