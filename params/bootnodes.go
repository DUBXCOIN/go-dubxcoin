// Copyright 2015 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package params

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main Ethereum network.
var MainnetBootnodes = []string{
	// DUBX/DEV Go Bootnodes 
	"enode://c70e454122e0d27db5dbd131c5571ee6a04a3adfb74f601f98670487f5d35292a5385835d955be5da05075fb963dc97026979ca68ad8e3d43999446432a68347@185.177.59.78:32609",
	"enode://050adf09ce4bfeddd61a988713e63fde7dbf17abed0e420acb0f93c6c82681d47223a3dcf515ecb4efa73ceb65d55268b9ca6083973659207d6429198ed77233@94.156.189.161:32609",
	"enode://540df9a808bc514c58f6a71c05fa8cc061f29913a2a2145b89846aa2a204a5b2dcc21c439eca30f63a10a0411dbfb4da4f06f8686a674f79d03288bbdfac0985@85.217.171.234:32609",
	"enode://92c0821bf3e9253039285d66d3b93fa7ea56ca81a621398d453e765974e711dc3eecf116b57ed79ced0a50ca6c9b21ca20a4a0949e5a7c68c7eccfd03945e4a4@206.81.15.228:32609",
	"enode://b9b5e116f356e6ea9131c99c24b1724de06618fe2e9a227429d790fd5c2a8855918bad035e92e5bd2a880eea1627cf934c5835e37082656d57520c2f624a3341@174.138.40.41:32609",
	"enode://2202876146a1932869fa22252fdfc538072416a76df6c75abcccb4a6c493a57fe3d0be6edc0fcbb7fd19a6ef4ee8034cd7961216990770fda8dab2eb31abf2b8@68.183.30.181:32609",

}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Ropsten test network.
var TestnetBootnodes = []string{
    "enode://5223f81f5992cd39c4266e60b578285b0af0e67bbdf41d810ee2b841e8b907e9de90cc07c34047db693d432ce85f15279c95f62e4aecb3d7444b06cf909e74d4@138.197.118.135:32609",
}

// RinkebyBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network.
var RinkebyBootnodes = []string{
	
}

// RinkebyV5Bootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network for the experimental RLPx v5 topic-discovery network.
var RinkebyV5Bootnodes = []string{
	
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{

}
