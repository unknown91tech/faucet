import { useEffect, useState } from "react";
import "./App.css";
import Web3 from "web3";
import detectEthereumProvider from '@metamask/detect-provider'

function App() {

  const [web3Api, setWeb3Api] = useState({
    provider: null,
    web3: null
  })

  const [account, setAccount] = useState(null)

  useEffect(() => {
    const loadProvider = async () => {
      const provider = await detectEthereumProvider();

      if (provider) {
        // provider.request({method: "eth_requestAccounts"}) instead of this we are giving an option for connection
        setWeb3Api({
          web3: new Web3(provider),
          provider
        })
      } else {
        console.error("Please, install Metamask.")
      }
     
    }

    loadProvider()
  }, [])

  useEffect(() => {
    const getAccount = async () => {
      const accounts = await web3Api.web3.eth.getAccounts()
      setAccount(accounts[0])
    }

    web3Api.web3 && getAccount()
  }, [web3Api.web3])

  return (
    <>
      <div className="faucet-wrapper">
        <div className="faucet">
        <span>
            <strong>Account: </strong>
          </span>
          <h1>
            { account 
            ? account 
            : <button className="button is-warning "
                      onClick={() =>
                        web3Api.provider.request({method: "eth_requestAccounts"}
                      )}
            >
                Connect Wallet
            </button>  
            }
          </h1>
          <div className="balance-view is-size-2">
            Current Balance: <strong>10</strong> ETH
          </div>
          
          <button className="button is-link is-light  mr-2">Donate</button>
          <button className="button is-primary is-light ">Withdraw</button>
        </div>
      </div>
    </>
  );
}

export default App;
