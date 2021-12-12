# FileStore
Safe decentralised file storage ensuring transparency and authenticity.

This is the (smart contract) repo for Polygon's [BUIDL-IT](https://buidlit.polygon.technology/) hackathon, 2021. See the submission [here](https://devfolio.co/submissions/filestore-1210)

I used this hackathon as an opportunity to get my hads dirty with blockchain and learn the things that I've been meaning to for a long time.

Thanks to the numerous workshops by Polygon throughout the course of the hackathon, I was able to learn blockchain devlopment and build this project in less than a day.

This project caused a hurdle when I had to build the frontend of the application because I'm a backend developer.

Similar to NFTs, this project allows people to store their files in a decentralised loication coupled with the security (by immutability) provided by blockchain. In a later version, I'd like to include a payment system so that the service cannot be spammed. Right now, I just put a switch to enable/disable it.

This can be used as a backend service (like AWS S3) where the CIDs are stored in a DB to reference the files.


## Stack
- Solidity
- Truffle
- Ganache
- Node.js
- HTML, CSS, JavaScript


## Getting started
1. Clone the repo.
2. `npm install`
3. `truffle migrate --network development` (Make sure Ganache is running)
4. `truffle test`

Watch the implementation at [https://youtu.be/iXuX9THJH_0](https://youtu.be/iXuX9THJH_0)

Test it out at [https://kevinam99.github.io/buidl-it-frontend/](https://kevinam99.github.io/buidl-it-frontend/)

Link to the frontend repo: [https://github.com/kevinam99/buidl-it-frontend](https://github.com/kevinam99/buidl-it-frontend)