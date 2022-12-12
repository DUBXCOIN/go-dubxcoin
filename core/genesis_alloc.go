// Copyright 2017 The go-ethereum Authors
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

package core

// Constants containing the genesis allocation of built-in genesis blocks.
// Their content is an RLP-encoded list of (address, balance) tuples.
// Use mkalloc.go to create/update them.

const mainnetAllocData = "\xe2\u1534\u0207\xf0\xaf\x19\xea@x\xb1x\xc4\xfb_M\xf0OG\xed\xfa\x8b\x0e\xe3\xa5\xf4\x8ah\xb5R\x00\x00\x00"
const testnetAllocData = "\xe2\u1534\u0207\xf0\xaf\x19\xea@x\xb1x\xc4\xfb_M\xf0OG\xed\xfa\x8b\x0e\xe3\xa5\xf4\x8ah\xb5R\x00\x00\x00"
const rinkebyAllocData = "\xe2\u1534\u0207\xf0\xaf\x19\xea@x\xb1x\xc4\xfb_M\xf0OG\xed\xfa\x8b\x0e\xe3\xa5\xf4\x8ah\xb5R\x00\x00\x00"
const devAllocData = "\xe2\u1534\u0207\xf0\xaf\x19\xea@x\xb1x\xc4\xfb_M\xf0OG\xed\xfa\x8b\x0e\xe3\xa5\xf4\x8ah\xb5R\x00\x00\x00"
