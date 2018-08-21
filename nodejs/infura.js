const Web3 = require('web3');
const web3 = new Web3();
const Tx = require('ethereumjs-tx');
var postgres = require("./Postgre");


var contractAddress = '0x4627dcb7f14b92d1866e421d9ad954cdd997b43f';
var abi = [{
    "constant": true,
    "inputs": [],
    "name": "mintingFinished",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "name",
    "outputs": [{"name": "", "type": "string"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_spender", "type": "address"}, {"name": "_value", "type": "uint256"}],
    "name": "approve",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "totalSupply",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_from", "type": "address"}, {"name": "_to", "type": "address"}, {
        "name": "_value",
        "type": "uint256"
    }],
    "name": "transferFrom",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "rate",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "INITIAL_SUPPLY",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [{"name": "", "type": "address"}],
    "name": "countClaimsToken",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "decimals",
    "outputs": [{"name": "", "type": "uint8"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [{"name": "_currentTime", "type": "uint256"}],
    "name": "validPurchaseTime",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_newRate", "type": "uint256"}],
    "name": "setRate",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [],
    "name": "claim",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_spender", "type": "address"}, {"name": "_subtractedValue", "type": "uint256"}],
    "name": "decreaseApproval",
    "outputs": [{"name": "success", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [{"name": "_owner", "type": "address"}],
    "name": "balanceOf",
    "outputs": [{"name": "balance", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "tokenAllocated",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [],
    "name": "finishMinting",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "owner",
    "outputs": [{"name": "", "type": "address"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "symbol",
    "outputs": [{"name": "", "type": "string"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_token", "type": "address"}],
    "name": "claimTokensToOwner",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_newOwner", "type": "address"}],
    "name": "changeOwner",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_to", "type": "address"}, {"name": "_value", "type": "uint256"}],
    "name": "transfer",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_beneficiar", "type": "address"}],
    "name": "calcAmount",
    "outputs": [{"name": "amount", "type": "uint256"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [{"name": "", "type": "address"}],
    "name": "contractUsers",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_to", "type": "address"}, {"name": "_value", "type": "uint256"}, {
        "name": "_data",
        "type": "bytes"
    }],
    "name": "transfer",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [],
    "name": "transfersEnabled",
    "outputs": [{"name": "", "type": "bool"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_spender", "type": "address"}, {"name": "_addedValue", "type": "uint256"}],
    "name": "increaseApproval",
    "outputs": [{"name": "success", "type": "bool"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": true,
    "inputs": [{"name": "_owner", "type": "address"}, {"name": "_spender", "type": "address"}],
    "name": "allowance",
    "outputs": [{"name": "remaining", "type": "uint256"}],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_investor", "type": "address"}],
    "name": "buyTokens",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": true,
    "stateMutability": "payable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_transfersEnabled", "type": "bool"}],
    "name": "enableTransfers",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "constant": false,
    "inputs": [{"name": "_weiAmount", "type": "uint256"}],
    "name": "validPurchaseTokens",
    "outputs": [{"name": "", "type": "uint256"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
}, {
    "inputs": [{"name": "_owner", "type": "address"}],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
}, {"payable": true, "stateMutability": "payable", "type": "fallback"}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "previousOwner", "type": "address"}, {
        "indexed": true,
        "name": "newOwner",
        "type": "address"
    }],
    "name": "OwnerChanged",
    "type": "event"
}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "beneficiary", "type": "address"}, {
        "indexed": false,
        "name": "value",
        "type": "uint256"
    }, {"indexed": false, "name": "amount", "type": "uint256"}],
    "name": "TokenPurchase",
    "type": "event"
}, {
    "anonymous": false,
    "inputs": [{"indexed": false, "name": "tokenRaised", "type": "uint256"}, {
        "indexed": false,
        "name": "purchasedToken",
        "type": "uint256"
    }],
    "name": "TokenLimitReached",
    "type": "event"
}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "sender", "type": "address"}, {
        "indexed": false,
        "name": "weiAmount",
        "type": "uint256"
    }],
    "name": "MinWeiLimitReached",
    "type": "event"
}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "to", "type": "address"}, {
        "indexed": false,
        "name": "amount",
        "type": "uint256"
    }],
    "name": "Mint",
    "type": "event"
}, {"anonymous": false, "inputs": [], "name": "MintFinished", "type": "event"}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "from", "type": "address"}, {
        "indexed": true,
        "name": "to",
        "type": "address"
    }, {"indexed": false, "name": "value", "type": "uint256"}, {"indexed": false, "name": "data", "type": "bytes"}],
    "name": "Transfer",
    "type": "event"
}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "_from", "type": "address"}, {
        "indexed": true,
        "name": "_to",
        "type": "address"
    }, {"indexed": false, "name": "_value", "type": "uint256"}],
    "name": "Transfer",
    "type": "event"
}, {
    "anonymous": false,
    "inputs": [{"indexed": true, "name": "_owner", "type": "address"}, {
        "indexed": true,
        "name": "_spender",
        "type": "address"
    }, {"indexed": false, "name": "_value", "type": "uint256"}],
    "name": "Approval",
    "type": "event"
}];

contract = web3.eth.contract(abi).at(contractAddress);

var myWallet = '0x5a204d1ca98e8de8566b20951e55f9d710e65947';
var myPrivateKey = 'ED4F8ECCC108FAEED0BFEBEA1CE81FEF66E58AF7A236A72A556CCBF924BD9285';

var decimalToken = 1e18;
var gasPriceGwei = 10 * 1e9; //10 GWEY
var gasLimit = 4600000;

web3.setProvider(new web3.providers.HttpProvider('https://ropsten.infura.io/v3/c6e9db1239aa4f0ea43853683edc1d0e'));
if (!web3.isConnected())
    console.log("not connected");
else
    console.log("connected");
web3.eth.defaultAccount = web3.eth.accounts[0];

//claimTokens();
//buyMyTokens();


/*
function claimTokens() {
    console.log("myWallet = " + myWallet);
    var nonce = web3.eth.getTransactionCount(myWallet);
    var gasPriced = web3.eth.gasPrice.toNumber() * 1.40;
    const rawTransaction = {
        from: myWallet,
        to: contractAddress,
        nonce: web3.toHex(web3.eth.getTransactionCount(myWallet)),
        gasPrice: web3.toHex(gasPriceGwei),
        gasLimit: web3.toHex(gasLimit),
        value: 0,
        data: contract.claim.getData({from: myWallet})
    };

    let privateKey = new Buffer(myPrivateKey, 'hex');
    var tx = new Tx(rawTransaction);
    tx.sign(privateKey);
    console.log("Validation:", tx.validate());
    
    var serializedTx = '0x' + tx.serialize().toString('hex');

    web3.eth.sendRawTransaction(serializedTx, function (err, txHash) {
        console.log(err, txHash);
        if (err != undefined) {
            console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
    });
}
*/


/*
function buyMyTokens() {
    console.log("myWallet = " + myWallet);
    var sendEth = 0.1 * decimalToken;
    console.log("sendEth = " + sendEth);

    const rawTransaction = {
        from: myWallet,
        to: contractAddress,
        nonce: web3.toHex(web3.eth.getTransactionCount(myWallet)),
        gasPrice: web3.toHex(gasPriceGwei),
        gasLimit: web3.toHex(gasLimit),
        value: sendEth,
        data: contract.buyTokens.getData(myWallet, {from: myWallet})
    };

    let privateKey = new Buffer(myPrivateKey, 'hex');
    var tx = new Tx(rawTransaction);
    tx.sign(privateKey);
    console.log("Validation:", tx.validate());
    var serializedTx = '0x' + tx.serialize().toString('hex');

    var returnError = "";
    web3.eth.sendRawTransaction(serializedTx, function (err, txHash) {
        console.log(err, txHash);
        if (err != undefined) {
            console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
    });
*/

module.exports.balanceOfToken = function (myWalletFunc) {
    var balanceToken = contract.balanceOf.call(myWalletFunc) / decimalToken;
    console.log("balanceToken = " + balanceToken.toFixed(18));
    return balanceToken.toFixed(18);
}


module.exports.balanceOfEther = function (myWalletFunc) {
    var balanceEther = web3.fromWei(web3.eth.getBalance(myWalletFunc), "ether");
    console.log("balanceEther = " + balanceEther);
    return balanceEther;
}

module.exports.sendToken = async function (myWalletFunc, step, idTask, currentArrayAddresses) {
    var txHash = await
    postgres.getPendingStatusTask(idTask);
    if (txHash == undefined) {
        //var nonce = web3.eth.getTransactionCount(myWallet);
        //var gasPriced = web3.eth.gasPrice.toNumber() * 1.40;
        const rawTransaction = {
            from: myWallet,
            to: contractAddress,
            nonce: web3.toHex(web3.eth.getTransactionCount(myWallet)),
            gasPrice: web3.toHex(gasPriceGwei),
            gasLimit: web3.toHex(gasLimit),
            value: 0,
            data: contract.claim.getData({from: myWallet})
        };

        let privateKey = new Buffer(myPrivateKey, 'hex');
        var tx = new Tx(rawTransaction);
        tx.sign(privateKey);
        console.log("Validation:", tx.validate());

        var serializedTx = '0x' + tx.serialize().toString('hex');

        web3.eth.sendRawTransaction(serializedTx, async (err, hash) => {
            if (!err) {
            console.log('hash:', hash);
            await
            postgres.setPendingStatusTask(idTask, hash);
            await
            postgres.putTransferHistory(currentArrayAddresses, step, idTask, hash);
            sleep(2000);
            }
            else {
                //console.log('err:', err.Error);
            }
        });
    } else {
        var isPending = isPendingTransaction(txHash);
        if (!isPending) {
            await
            postgres.setPendingStatusTask(idTask, null);
            sleep(2000);
        }
    }
}

function isPendingTransaction(txHash) {
    var result = web3.toHex(web3.eth.getTransaction(txHash));
    if (result.blockNumber == undefined) {
        return false;
    } else {
        console.log("result.blockNumber = " + result.blockNumber);
        return true;
    }
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}